{pkgs, ...}: let
  nord = {
    background = "#2E3440FF";
    background-alt = "#383E4AFF";
    foreground = "#E5E9F0FF";
    selected = "#81A1C1FF";
    active = "#A3BE8CFF";
    urgent = "#BF616AFF";
  };

  onedark = {
    background = "#1E2127FF";
    background-alt = "#282B31FF";
    foreground = "#FFFFFFFF";
    selected = "#61AFEFFF";
    active = "#98C379FF";
    urgent = "#E06C75FF";
  };

  # The .rasi files @import "shared/colors.rasi" relative to themselves, so the
  # theme has to ship as a directory rather than a single file.
  mkTheme = {
    name,
    styleFile,
    colors,
    font,
  }: let
    colorsFile = pkgs.writeText "colors.rasi" ''
      * {
          background:     ${colors.background};
          background-alt: ${colors.background-alt};
          foreground:     ${colors.foreground};
          selected:       ${colors.selected};
          active:         ${colors.active};
          urgent:         ${colors.urgent};
      }
    '';

    fontsFile = pkgs.writeText "fonts.rasi" ''
      * {
          font: "${font}";
      }
    '';
  in
    pkgs.runCommand "rofi-theme-${name}" {} ''
      mkdir -p "$out/shared"
      cp ${styleFile} "$out/theme.rasi"
      cp ${colorsFile} "$out/shared/colors.rasi"
      cp ${fontsFile} "$out/shared/fonts.rasi"
    '';

  launcherTheme = mkTheme {
    name = "launcher";
    styleFile = ../../../dotfiles/rofi/themes/style-5.rasi;
    colors = nord;
    font = "JetBrainsMono Nerd Font Mono Medium 12";
  };

  powermenuTheme = mkTheme {
    name = "powermenu";
    styleFile = ../../../dotfiles/rofi/powermenu/type-2/style-1.rasi;
    colors = onedark;
    font = "JetBrains Mono Nerd Font 10";
  };

  powermenu = pkgs.writeShellApplication {
    name = "powermenu";
    runtimeInputs = with pkgs; [rofi systemd coreutils gnused hyprland];
    text =
      builtins.replaceStrings
      ["#!/usr/bin/env bash\n" "@theme@"]
      ["" "${powermenuTheme}/theme.rasi"]
      (builtins.readFile ../../../dotfiles/rofi/powermenu/type-2/powermenu.sh);
  };
in {
  home.packages = [powermenu];

  programs.rofi = {
    enable = true;
    theme = "${launcherTheme}/theme.rasi";

    extraConfig = {
      show-icons = true;
      hide-scrollbar = true;
      sidebar-mode = false;
      hover-select = true;
      kb-remove-to-eol = "Control+p";
      kb-secondary-copy = "Control+c";
      kb-accept-entry = "Return";
      kb-mode-complete = "";
      kb-remove-char-back = "BackSpace";
      kb-row-up = "Up,Control+k";
      kb-row-down = "Down,Control+j";
      kb-row-right = "Control+l";
      kb-row-left = "Control+h";
    };
  };
}
