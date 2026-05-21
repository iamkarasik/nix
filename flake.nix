{
  description = "Systems using Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

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
    unstable,
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
      homeModule = ./hosts/NixOS/home.nix;
    };

    workSettings = {
      stateVersion = "25.11";
      system = "aarch64-darwin";
      username = "ilankarasik";
      gitUserName = "Ilan Karasik";
      gitUserEmail = "ikarasik@confluent.io";
      homeModule = ./hosts/MacOS/home.nix;
    };

    unstableOverlay = final: _prev: {
      unstable = import unstable {
        inherit (final) system;
        config.allowUnfree = true;
      };
    };

    nixpkgsConfig = {
      nixpkgs.config.allowUnfree = true;
      nixpkgs.overlays = [unstableOverlay];
    };

    hmSystemModule = cfg: {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${cfg.username} = cfg.homeModule;
      home-manager.extraSpecialArgs = cfg // {inherit inputs;};
    };

    mkHome = cfg:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit (cfg) system;
          config.allowUnfree = true;
          overlays = [unstableOverlay];
        };
        extraSpecialArgs = cfg // {inherit inputs;};
        modules = [cfg.homeModule];
      };
  in {
    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      system = personalSettings.system;
      specialArgs = personalSettings;
      modules = [
        nixpkgsConfig
        ./hosts/NixOS/configuration.nix
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        (hmSystemModule personalSettings)
      ];
    };

    darwinConfigurations.MacOS = nix-darwin.lib.darwinSystem {
      system = workSettings.system;
      specialArgs = workSettings;
      modules = [
        nixpkgsConfig
        ./hosts/MacOS/configuration.nix
        inputs.stylix.darwinModules.stylix
        home-manager.darwinModules.home-manager
        (hmSystemModule workSettings)
      ];
    };

    homeConfigurations.${personalSettings.username} = mkHome personalSettings;
    homeConfigurations.${workSettings.username} = mkHome workSettings;
  };
}
