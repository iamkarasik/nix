{ pkgs, ... }:

{
  programs.zsh.enable = true;
  programs.git.enable = true;
  environment.systemPackages = with pkgs; [
    neovim
    htop
  ];
}
