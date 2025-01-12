# /hosts/nixos/home.nix
{ pkgs, stateVersion, username, ... }:

let
  common = import ../../home-manager/common.nix { inherit pkgs; };
in
{
  imports = [ common ];

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

  # Enable Home Manager for the user
  home.username = username;  # Replace with your actual username
  home.homeDirectory = "/home/${username}";  # Replace with your actual home directory if needed

  # Enable Git
  programs.git.enable = true;
  
  # Enable system-wide packages through Home Manager
  home.packages = with pkgs; [
    neovim
    htop
    curl
    wget
    neofetch
    discord
  ];

  home.file = {
    ".config/hypr".source = ../../dotfiles/hypr;
    ".config/wallpaper".source = ../../dotfiles/wallpaper;
    ".config/waybar".source = ../../dotfiles/waybar;
  };

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = stateVersion;
}
