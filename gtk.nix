{ pkgs }:

{
  environment.variables = {
    GTK_THEME = "Adwaita-dark";       # Replace with your desired GTK theme
    GTK_ICON_THEME = "Papirus";       # Replace with your desired icon theme
    GTK_CURSOR_THEME = "Breeze_Snow"; # Replace with your desired cursor theme
    GTK2_RC_FILES = "${pkgs.gtk2}/etc/gtk-2.0/gtkrc"; # Ensure GTK2 apps respect theme
  };

  environment.systemPackages = with pkgs; [
    gnome-themes-extra  # Provides common GTK themes
    papirus-icon-theme  # Example: Papirus icon theme
    breeze-cursors      # Example: Breeze cursor theme
  ];

  fonts.fonts = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "ZedMono" ]; };
  ];
}
