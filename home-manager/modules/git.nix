{...}: {
  programs.git = {
    enable = true;

    settings = {
      alias = {
        oops = "commit --amend --no-edit";
        url = "config get remote.origin.url";
      };
    };
  };
}
