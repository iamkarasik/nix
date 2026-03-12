{system}: let
  fonts = {
    "aarch64-darwin" = {size = 13.0;};
    "x86_64-linux" = {size = 11.0;};
  };
in {
  enable = true;
  enableZshIntegration = true;
  settings = {
    adjust-cell-width = "4%";
    adjust-cell-height = "8%";

    font-family = "JetBrainsMonoNL Nerd Font";
    font-size = fonts.${system}.size;
    font-thicken = true;
    macos-option-as-alt = true;
    theme = "vscode";
    window-decoration = "none";

    window-padding-x = 6;
    window-padding-y = 4;
    window-padding-balance = true;

    keybind = [
      "alt+0=unbind"
      "alt+1=unbind"
      "alt+2=unbind"
      "alt+3=unbind"
      "alt+4=unbind"
      "alt+5=unbind"
      "alt+6=unbind"
      "alt+7=unbind"
      "alt+8=unbind"
      "alt+9=unbind"
    ];
  };

  themes = {
    darkmatter = {
      background = "000000";
      foreground = "ffffff";
      palette = [
        "0=#000000"
        "1=#5f8787"
        "2=#fbcb97"
        "3=#e78a53"
        "4=#888888"
        "5=#999999"
        "6=#aaaaaa"
        "7=#c1c1c1"
        "8=#333333"
        "9=#5f8787"
        "10=#fbcb97"
        "11=#e78a53"
        "12=#888888"
        "13=#999999"
        "14=#aaaaaa"
        "15=#c1c1c1"
      ];
      selection-background = "444444";
      selection-foreground = "000000";
    };
    vscode = {
      background = "1e1e1e";
      cursor-color = "cccccc";
      foreground = "d4d4d4";
      palette = [
        "0=#000000" # normal black
        "1=#cd3131" # normal red
        "2=#0dbc79" # normal green
        "3=#e5e510" # normal yellow
        "4=#2472c8" # normal blue
        "5=#bc3fbc" # normal magenta
        "6=#11a8cd" # normal cyan
        "7=#e5e5e5" # normal white
        "8=#666666" # bright black
        "9=#f14c4c" # bright red
        "10=#23d18b" # bright green
        "11=#f5f543" # bright yellow
        "12=#3b8eea" # bright blue
        "13=#d670d6" # bright magenta
        "14=#29b8db" # bright cyan
        "15=#e5e5e5" # bright white
      ];
      selection-background = "2d2d2d";
      selection-foreground = "d4d4d4";
    };
  };
}
