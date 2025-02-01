{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    fzf
    jq
    ripgrep
    yq
  ];
}
