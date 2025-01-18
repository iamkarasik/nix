{ pkgs, ... }:

let
  customAlacritty = import ./config/alacritty/alacritty.nix;
  customFonts = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "ZedMono" ]; };
  customLsd = import ./config/lsd/lsd.nix;
  customZsh = import ./config/zsh/zsh.nix;
  customNvim = import ./config/nvim/nvim.nix;
in
{

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    alacritty = customAlacritty pkgs;
    lsd = customLsd pkgs;
    neovim = customNvim pkgs;
    zsh = customZsh pkgs;
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
