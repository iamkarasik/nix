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

  personal = with pkgs; [
    raycast
    spotify
  ];

  home.file = {
  };

  home.stateVersion = stateVersion;
}
