{
  description = "Systems using Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.11";
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
      stateVersion = "25.11";
      system = "x86_64-linux";
      username = "goose";
    };

    workSettings = {
      stateVersion = "25.11";
      system = "aarch64-darwin";
      username = "ilankarasik";
    };
  in {
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      system = personalSettings.system;
      specialArgs = personalSettings;
      modules = [
        {nixpkgs.config = {allowUnfree = true;};}
        ./hosts/NixOS/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
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
        {nixpkgs.config = {allowUnfree = true;};}
        ./hosts/MacOS/configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${workSettings.username} = ./hosts/MacOS/home.nix;
          home-manager.extraSpecialArgs = workSettings;
        }
      ];
    };

    homeConfigurations.${personalSettings.username} = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = personalSettings.system;
        config = {allowUnfree = true;};
      };
      extraSpecialArgs = personalSettings;
      modules = [./hosts/NixOS/home.nix];
    };

    homeConfigurations.${workSettings.username} = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = workSettings.system;
        config = {allowUnfree = true;};
      };
      extraSpecialArgs = workSettings;
      modules = [./hosts/MacOS/home.nix];
    };
  };
}
