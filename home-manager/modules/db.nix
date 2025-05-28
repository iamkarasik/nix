{pkgs, ...}: {
  home.packages = with pkgs; [
    pgloader
    postgresql
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
}
