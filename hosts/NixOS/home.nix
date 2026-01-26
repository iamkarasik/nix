{ pkgs, stateVersion, username, ... }:

{
  imports = [ 
    ../../home-manager/common.nix 
    ../../home-manager/modules/ghostty.nix
  ];

  gtk = {
    enable = true;

    theme.package = pkgs.whitesur-gtk-theme;
    theme.name = "WhiteSur-Dark";

    iconTheme.package = pkgs.whitesur-icon-theme;
    iconTheme.name = "WhiteSur-dark";

    cursorTheme.package = pkgs.capitaine-cursors;
    cursorTheme.name = "capitaine-cursors-white";
    cursorTheme.size = 30;
  };

  home.username = username;
  home.homeDirectory = "/home/${username}";

  programs.git.enable = true;
  
  home.packages = with pkgs; [
    discord
    spotify
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "discord"
    "spotify"
    "vault"
  ];

  home.file = {
    ".config/hypr".source = ../../dotfiles/hypr;
    ".config/rofi".source = ../../dotfiles/rofi;
    ".config/wallpaper".source = ../../dotfiles/wallpaper;
    ".config/waybar".source = ../../dotfiles/waybar;
  };

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = stateVersion;
}
