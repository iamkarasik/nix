{pkgs, ...}: {
  programs.git = {
    enable = true;

    settings = {
      aliases = {
        oops = "commit --amend --no-edit";
      };
    };
  };
}
