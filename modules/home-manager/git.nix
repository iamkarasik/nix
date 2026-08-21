{
  pkgs,
  config,
  ...
}: let
  git = config.iamkarasik.git;

  openCmd =
    if pkgs.stdenv.isDarwin
    then "open"
    else "xdg-open";
in {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = git.name;
        email = git.email;
      };

      alias = {
        oops = "commit --amend --no-edit";
        url = "config get remote.origin.url";
        open = "!sh -c '${openCmd} \"$(git config --get remote.origin.url)\"'";
      };

      worktree.guessRemote = true;
    };
  };
}
