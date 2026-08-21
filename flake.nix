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
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    unstable,
    nix-darwin,
    home-manager,
    ...
  }: let
    personalSettings = {
      system = "x86_64-linux";
      username = "goose";
      homeModule = ./hosts/NixOS/home.nix;
    };

    workSettings = {
      system = "aarch64-darwin";
      username = "ilankarasik";
      homeModule = ./hosts/MacOS/home.nix;
    };

    overlays = [
      (import ./overlays/unstable.nix {inherit unstable;})
      (import ./overlays/iamkarasik.nix)
    ];

    nixpkgsConfig = {
      nixpkgs.config.allowUnfree = true;
      nixpkgs.overlays = overlays;
    };

    hmSystemModule = cfg: {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${cfg.username} = cfg.homeModule;
      home-manager.extraSpecialArgs = cfg // {inherit inputs;};
    };
  in {
    checks = {
      x86_64-linux.NixOS = self.nixosConfigurations.NixOS.config.system.build.toplevel;
      aarch64-darwin.MacOS = self.darwinConfigurations.MacOS.system;
    };

    formatter = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
      aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;
    };

    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      system = personalSettings.system;
      specialArgs = personalSettings;
      modules = [
        nixpkgsConfig
        ./hosts/NixOS/configuration.nix
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
        home-manager.darwinModules.home-manager
        (hmSystemModule workSettings)
      ];
    };
  };
}
