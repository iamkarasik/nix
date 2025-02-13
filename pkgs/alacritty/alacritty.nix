{ system }: let 

  fonts = {
    "aarch64-darwin" = { size = 13.0; x = 1; y = 1; };
    "x86_64-linux" = { size = 12.0; x = 0; y = 0; };
  };

  curFont = fonts.${system} or { size = 12.0; x = 1; y = 1; };
in
{
  enable = true;
  settings = {
    general.import = [
      "${./themes/vscode.toml}"
    ];
    env = {
      TERM = "xterm-256color";
    };
    window = {
      dimensions = {
        columns = 0;
        lines = 0;
      };
      padding = {
        x = 0;
        y = 0;
      };
      dynamic_padding = false;
      decorations = "buttonless";
      opacity = 1.0;
      option_as_alt = "LeftOnly";
    };
    scrolling = {
      history = 100000;
      multiplier = 5;
    };
    font = {
        normal = {
          family = "JetBrainsMono Nerd Font Propo";
          style = "Light";
        };
        bold = {
          family = "JetBrainsMono Nerd Font Propo";
          style = "Regular";
        };
        italic = {
          family = "JetBrainsMono Nerd Font Propo";
          style = "Thin";
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
}
