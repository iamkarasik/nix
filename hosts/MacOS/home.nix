{
  pkgs,
  username,
  config,
  ...
}: {
  imports = [
    ../../modules/profiles/home.nix
    ../../modules/home-manager/darwin/aerospace.nix
  ];

  home.username = username;
  home.homeDirectory = "/Users/${username}";

  home.packages = with pkgs; [
    spotify
    aerospace
  ];

  programs.desktoppr = {
    enable = true;
    settings.picture = "${config.iamkarasik.wallpaper}";
  };

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.11";
}
