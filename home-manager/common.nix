{ pkgs, ... }:

let
  customFonts = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "ZedMono" ]; };
  customLsd = import ./config/lsd/lsd.nix;
  customZsh = import ./config/zsh/zsh.nix;
in
{

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    zsh = customZsh pkgs;
    lsd = customLsd pkgs;
  };

  home.packages = with pkgs; [
    customFonts
    fzf
    ripgrep
    tmux
  ];

  home.file = {
    ".config/tmux".source = ../dotfiles/tmux;
    ".config/zsh/themes".source = ./config/zsh/themes;
    ".config/zsh/plugins".source = ./config/zsh/plugins;
  };
}
