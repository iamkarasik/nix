{ pkgs, system, ... }:

let
  customAlacritty = import ../pkgs/alacritty/alacritty.nix;
  customFonts = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "ZedMono" ]; };
  customLsd = import ../pkgs/lsd/lsd.nix;
  customNvim = import ../pkgs/nvim/nvim.nix;
  customSonarLint = import ../pkgs/sonarlint-language-server/derivation.nix { inherit pkgs; };
  customZsh = import ../pkgs/zsh/zsh.nix;
in
{

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    neovim = customNvim pkgs;
    alacritty = customAlacritty { inherit system; };
    lsd = customLsd;
    zsh = customZsh;
  };

  home.packages = with pkgs; [
    customFonts
    fzf
    ripgrep
    tmux
    customSonarLint
  ];

  home.file = {
    ".config/tmux".source = ../dotfiles/tmux;
    ".config/zsh/themes".source = ../pkgs/zsh/themes;
    ".config/zsh/plugins".source = ../pkgs/zsh/plugins;
  };
}
