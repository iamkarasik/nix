{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../modules/profiles/home.nix
    ../../modules/home-manager/linux/hyprland.nix
    ../../modules/home-manager/linux/rofi.nix
    ../../modules/home-manager/linux/waybar.nix
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

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "kvantum";
  };

  # WhiteSur ships WhiteSurDark inside the WhiteSur folder, but Kvantum only
  # looks for <theme>/<theme>.kvconfig, so give the dark variant its own dir.
  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=WhiteSurDark
    '';
    "Kvantum/WhiteSurDark/WhiteSurDark.kvconfig".source = "${pkgs.whitesur-kde}/share/Kvantum/WhiteSur/WhiteSurDark.kvconfig";
    "Kvantum/WhiteSurDark/WhiteSurDark.svg".source = "${pkgs.whitesur-kde}/share/Kvantum/WhiteSur/WhiteSurDark.svg";
  };

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.11";
}
