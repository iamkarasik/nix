{pkgs, ...}: {
  home.packages = with pkgs; [
    pgloader
    postgresql
    sql-formatter
  ];

  programs.pgcli = {
    enable = true;
    settings = {
      main = {
        # row_limit = 0;
        keyring = "False";
        pager = "nvim";
      };
    };
  };

  home.file = {
    ".psqlrc".source = ../../dotfiles/psql/.psqlrc;
  };
}
