{
  description = "Systems using Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  }: let
    personalSettings = {
      stateVersion = "25.05";
      system = "x86_64-linux";
      username = "goose";
    };

    workSettings = {
      stateVersion = "25.05";
      system = "aarch64-darwin";
      username = "ilankarasik";
    };
  in {
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      system = personalSettings.system;
      specialArgs = personalSettings;
      modules = [
        ./hosts/NixOS/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.users.${personalSettings.username} = ./hosts/NixOS/home.nix;
          home-manager.extraSpecialArgs = personalSettings;
        }
      ];
    };

    darwinConfigurations.MacOS = nix-darwin.lib.darwinSystem {
      system = workSettings.system;
      specialArgs = workSettings;
      modules = [
        ./hosts/MacOS/configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.users.${workSettings.username} = ./hosts/MacOS/home.nix;
          home-manager.extraSpecialArgs = workSettings;
          users.users.${workSettings.username}.home = "/Users/${workSettings.username}";
        }
      ];
    };

    homeConfigurations.${personalSettings.username} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${personalSettings.system};
      extraSpecialArgs = personalSettings;
      modules = [./hosts/NixOS/home.nix];
    };

    homeConfigurations.${workSettings.username} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${workSettings.system};
      extraSpecialArgs = workSettings;
      modules = [./hosts/MacOS/home.nix];
    };
  };
}
