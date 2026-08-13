{
  pkgs,
  stateVersion,
  username,
  ...
}: {
  imports = [
    ../../home-manager/common.nix
    ../../home-manager/modules/NixOS/hyprland.nix
    ../../home-manager/modules/NixOS/rofi.nix
    ../../home-manager/modules/NixOS/waybar.nix
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

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = stateVersion;
}
