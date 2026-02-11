{pkgs, ...}: {
  programs.git = {
    enable = true;

    settings = {
      alias = {
        oops = "commit --amend --no-edit";
      };
    };
  };
}
