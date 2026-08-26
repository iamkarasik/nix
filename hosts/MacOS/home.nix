{
  pkgs,
  username,
  osConfig,
  ...
}: {
  imports = [
    ../../modules/profiles/home.nix
    ../../modules/home-manager/darwin/aerospace.nix
  ];

  home.username = username;
  home.homeDirectory = "/Users/${username}";

  home.packages = with pkgs; [
    aerospace
    spotify
    pkgs.unstable.docker-client
    pkgs.unstable.colima
  ];

  programs.desktoppr = {
    enable = true;
    settings.picture = "${osConfig.iamkarasik.wallpaper}";
  };

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.11";
}
