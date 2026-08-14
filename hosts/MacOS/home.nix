{
  pkgs,
  username,
  wallpaper,
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

  programs.desktoppr = {
    enable = true;
    settings.picture = "${wallpaper}";
  };

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.11";
}
