{
  description = "Systems using Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: let
    stateVersion = "24.11";
    username = "goose";
    system = "x86_64-linux";
    personalSettings = {
      inherit username;
      inherit stateVersion;
      inherit system;
    };
  in
  {

    nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = personalSettings;
      modules = [
        ./hosts/NixOS/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = ./hosts/NixOS/home.nix;
          home-manager.extraSpecialArgs = personalSettings;
        }
      ];
    };

    homeConfigurations.goose = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = personalSettings;
      modules = [
        ./hosts/NixOS/home.nix
      ];
    };

  };
}

