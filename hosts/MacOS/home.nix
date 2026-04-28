{
  pkgs,
  stateVersion,
  username,
  ...
}: {
  imports = [
    ../../home-manager/common.nix
    ../../home-manager/modules/MacOS/aerospace.nix
    ../../home-manager/modules/fonts
  ];

  home.username = username;
  home.homeDirectory = "/Users/${username}";

  home.packages = with pkgs; [
    spotify
    aerospace
  ];

  home.stateVersion = stateVersion;
}
