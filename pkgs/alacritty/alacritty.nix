{ system }: let 

  fonts = {
    "aarch64-darwin" = { size = 13.0; x = 1; y = 1; };
    "x86_64-linux" = { size = 12.0; x = 0; y = 0; };
  };

  term = {
    "aarch64-darwin" = "xterm-256color";
  };

  curFont = fonts.${system} or { size = 12.0; x = 1; y = 1; };
  curTerm = term.${system} or "alacritty";
in
{
  enable = true;
  settings = {
    general.import = [
      "${./themes/vscode.toml}"
    ];
    env = {
      TERM = curTerm;
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
      option_as_alt = "OnlyLeft";
    };
    scrolling = {
      history = 100000;
      multiplier = 5;
    };
    font = {
        # normal = {
        #   family = "SpaceMono Nerd Font";
        #   style = "ExtraLight";
        # };
        # bold = {
        #   family = "SpaceMono Nerd Font";
        #   style = "Regular";
        # };
        # italic = {
        #   family = "SpaceMono Nerd Font";
        #   style = "ThinItalic";
        # };
        normal = {
          family = "JetBrainsMonoNL Nerd Font";
          style = "ExtraLight";
        };
        bold = {
          family = "JetBrainsMonoNL Nerd Font";
          style = "Regular";
        };
        italic = {
          family = "JetBrainsMonoNL Nerd Font";
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
}
