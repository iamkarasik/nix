{
  pkgs,
  inputs,
  stateVersion,
  username,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.default
    ../../home-manager/common.nix
    ../../home-manager/modules/stylix.nix
    ../../home-manager/modules/zen-browser.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    discord
    spotify
  ];

  xdg.configFile = {
    "hypr".source = ../../dotfiles/hypr;
    "rofi".source = ../../dotfiles/rofi;
    "wallpaper".source = ../../dotfiles/wallpaper;
    "waybar".source = ../../dotfiles/waybar;
  };

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = stateVersion;
}
