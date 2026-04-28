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

    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  }: let
    personalSettings = {
      stateVersion = "25.11";
      system = "x86_64-linux";
      username = "goose";
      gitUserName = "iamkarasik";
      gitUserEmail = "ilankarasik@gmail.com";
    };

    workSettings = {
      stateVersion = "25.11";
      system = "aarch64-darwin";
      username = "ilankarasik";
      gitUserName = "Ilan Karasik";
      gitUserEmail = "ikarasik@confluent.io";
    };
  in {
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      system = personalSettings.system;
      specialArgs = personalSettings;
      modules = [
        {nixpkgs.config = {allowUnfree = true;};}
        ./hosts/NixOS/configuration.nix
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${personalSettings.username} = ./hosts/NixOS/home.nix;
          home-manager.extraSpecialArgs = personalSettings // {inherit inputs;};
        }
      ];
    };

    darwinConfigurations.MacOS = nix-darwin.lib.darwinSystem {
      system = workSettings.system;
      specialArgs = workSettings;
      modules = [
        {nixpkgs.config = {allowUnfree = true;};}
        ./hosts/MacOS/configuration.nix
        inputs.stylix.darwinModules.stylix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${workSettings.username} = ./hosts/MacOS/home.nix;
          home-manager.extraSpecialArgs = workSettings // {inherit inputs;};
        }
      ];
    };

    homeConfigurations.${personalSettings.username} = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = personalSettings.system;
        config = {allowUnfree = true;};
      };
      extraSpecialArgs = personalSettings // {inherit inputs;};
      modules = [./hosts/NixOS/home.nix];
    };

    homeConfigurations.${workSettings.username} = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = workSettings.system;
        config = {allowUnfree = true;};
      };
      extraSpecialArgs = workSettings // {inherit inputs;};
      modules = [./hosts/MacOS/home.nix];
    };
  };
}
