{pkgs, ...}: {
  programs.git = {
    enable = true;

    aliases = {
      oops = "commit --amend --no-edit";
    };
  };
}
