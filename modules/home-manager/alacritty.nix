{
  pkgs,
  config,
  ...
}: let
  fonts = config.iamkarasik.fonts;

  curFont =
    if pkgs.stdenv.isDarwin
    then {
      size = 13.0;
      x = 1;
      y = 1;
    }
    else {
      size = 10.0;
      x = 0;
      y = 1;
    };
  curTerm =
    if pkgs.stdenv.isDarwin
    then "xterm-256color"
    else "alacritty";
in {
  programs.alacritty = {
    enable = true;
    settings = {
      general.import = ["${../../dotfiles/alacritty/themes/vscode.toml}"];
      env = {
        TERM = curTerm;
      };
      window = {
        dimensions = {
          columns = 0;
          lines = 0;
        };
        padding = {
          x = 4;
          y = 6;
        };
        dynamic_padding = false;
        decorations = "buttonless";
        opacity = 1.0;
        option_as_alt = "OnlyLeft";
      };
      scrolling = {
        history = 100000;
        multiplier = 5;
      };
      font = {
        normal = {
          family = fonts.mono;
          style = "Regular";
        };
        bold = {
          family = fonts.mono;
          style = "Bold";
        };
        italic = {
          family = fonts.mono;
          style = "ThinItalic";
        };
        size = curFont.size;
        offset = {
          x = curFont.x;
          y = curFont.y;
        };
      };
      cursor = {
        style = "Block";
      };
      selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>";
        save_to_clipboard = false;
      };
    };
  };
}
