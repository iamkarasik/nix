{
  pkgs,
  config,
  ...
}: let
  git = config.iamkarasik.git;

  gitOpen =
    pkgs.writeShellScriptBin "git-open"
    (builtins.readFile ../../dotfiles/scripts/git-open.sh);
in {
  home.packages = [gitOpen];

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
      };

      worktree.guessRemote = true;
    };
  };
}
