{pkgs, ...}: let
  openCmd =
    if pkgs.stdenv.isDarwin
    then "open"
    else "xdg-open";
in {
  programs.git = {
    enable = true;

    settings = {
      alias = {
        oops = "commit --amend --no-edit";
        url = "config get remote.origin.url";
        open = "!sh -c '${openCmd} \"$(git config --get remote.origin.url)\"'";
      };
    };
  };
}
