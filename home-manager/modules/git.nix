{
  pkgs,
  gitUserName,
  gitUserEmail,
  ...
}: let
  openCmd =
    if pkgs.stdenv.isDarwin
    then "open"
    else "xdg-open";
in {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = gitUserName;
        email = gitUserEmail;
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
