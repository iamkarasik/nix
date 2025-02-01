{ pkgs, system, ... }:

let
  customAlacritty = import ../pkgs/alacritty/alacritty.nix;
  customLsd = import ../pkgs/lsd/lsd.nix;
  customNvim = import ../pkgs/nvim/nvim.nix;
  customSonarLint = import ../pkgs/sonarlint-language-server/derivation.nix { inherit pkgs; };
  customZsh = import ../pkgs/zsh/zsh.nix;

  # Extra 
  golang = import ./modules/golang.nix { inherit pkgs; };
  k8s = import ./modules/k8s.nix { inherit pkgs; };
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
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "ZedMono" ]; })
    bat
    customSonarLint
    fzf
    jq
    ripgrep
    tmux
  ] ++ golang ++ k8s;

  home.file = {
    ".config/tmux".source = ../dotfiles/tmux;
    ".config/zsh/themes".source = ../pkgs/zsh/themes;
    ".config/zsh/plugins".source = ../pkgs/zsh/plugins;
  };
}
