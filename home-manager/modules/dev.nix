{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    curl
    fd
    fzf
    htop
    jq
    neofetch
    ripgrep
    wget
    yq
  ];
}
