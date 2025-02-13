{ pkgs, stateVersion, username, ... }:

{
  imports = [
    ../../home-manager/common.nix
    ../../home-manager/modules/cloud-tooling.nix
    ../../home-manager/modules/core-tooling.nix
    ../../home-manager/modules/extra.nix
    ../../home-manager/modules/ide.nix
  ];

  home.username = username;
  home.homeDirectory = "/Users/${username}";

  home.packages = with pkgs; [
    raycast
    spotify
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "confluent-cli"
    "goland"
    "idea-community"
    "raycast"
    "spotify"
    "vault"
  ];

  home.file = {
  };

  home.stateVersion = stateVersion;
}
