pkgs: {
  enable = true;
  enableAliases = true;
  settings = {
    classic = false;
    color = {
      when = "auto";
      theme = "default";
    };
    date = "date";
    dereference = false;
    icons = {
      when = "auto";
      theme = "fancy";
      separator = " ";
    };
    indicators = false;
    layout = "grid";
    recursion = {
      enabled = false;
    };
    size = "default";
    sorting = {
      column = "name";
      reverse = false;
      dir-grouping = "none";
    };
    no-symlink = false;
    total-size = false;
    symlink-arrow = "⇒";
  };
}
