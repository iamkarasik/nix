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
    ../../home-manager/modules/zen-browser.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    discord
    spotify
  ];

  gtk = {
    enable = true;
    theme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-gtk-theme;
    };
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
  };

  xdg.configFile = {
    "hypr".source = ../../dotfiles/hypr;
    "rofi".source = ../../dotfiles/rofi;
    "wallpaper".source = ../../dotfiles/wallpaper;
    "waybar".source = ../../dotfiles/waybar;
  };

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = stateVersion;
}
