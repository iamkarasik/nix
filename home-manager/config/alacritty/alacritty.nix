pkgs: {
  enable = true;
  settings = {
    general.import = [
      "~/.config/home-manager/config/alacritty/themes/vscode.toml"
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
        size = 14.0;
        offset = {
          x = 1;
          y = 4;
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
