{ pkgs, system, ... }:

let
  customAlacritty = import ../pkgs/alacritty/alacritty.nix;
  customLsd = import ../pkgs/lsd/lsd.nix;
  customNvim = import ../pkgs/nvim/nvim.nix;
  customSonarLint = import ../pkgs/sonarlint-language-server/derivation.nix { inherit pkgs; };
  customZsh = import ../pkgs/zsh/zsh.nix;
in
{
  imports = [
    ./modules/dev.nix
    ./modules/fonts.nix
    ./modules/golang.nix
    ./modules/k8s.nix
  ];

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
    customSonarLint
    tmux
  ];

  home.file = {
    ".config/tmux".source = ../dotfiles/tmux;
    ".config/zsh/themes".source = ../pkgs/zsh/themes;
    ".config/zsh/plugins".source = ../pkgs/zsh/plugins;
  };
}
