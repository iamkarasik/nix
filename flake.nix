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
      stateVersion = "25.11";
      system = "x86_64-linux";
      username = "goose";
      gitUserName = "iamkarasik";
      gitUserEmail = "ilankarasik@gmail.com";
      homeModule = ./hosts/NixOS/home.nix;
      wallpaper = "${./dotfiles/wallpaper}/current";
    };

    workSettings = {
      stateVersion = "25.11";
      system = "aarch64-darwin";
      username = "ilankarasik";
      gitUserName = "Ilan Karasik";
      gitUserEmail = "ikarasik@confluent.io";
      homeModule = ./hosts/MacOS/home.nix;
      wallpaper = "${./dotfiles/wallpaper}/current";
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
