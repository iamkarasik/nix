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
    ../../home-manager/modules/ghostty.nix
    ../../home-manager/modules/stylix.nix
    ../../home-manager/modules/zen-browser.nix
  ];

  # gtk = {
  #   enable = true;
  #
  #   theme.package = pkgs.whitesur-gtk-theme;
  #   theme.name = "WhiteSur-Dark";
  #
  #   iconTheme.package = pkgs.whitesur-icon-theme;
  #   iconTheme.name = "WhiteSur-dark";
  #
  #   cursorTheme.package = pkgs.capitaine-cursors;
  #   cursorTheme.name = "capitaine-cursors-white";
  #   cursorTheme.size = 30;
  # };

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
