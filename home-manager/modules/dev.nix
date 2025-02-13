{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    curl
    fzf
    htop
    jq
    neofetch
    ripgrep
    wget
    yq
  ];
}
