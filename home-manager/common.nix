{ ... }:

{
  imports = [
    ./modules/alacritty.nix
    ./modules/dev.nix
    ./modules/fonts.nix
    ./modules/java.nix
    ./modules/golang.nix
    ./modules/k8s.nix
    ./modules/lsd.nix
    ./modules/nvim.nix
    ./modules/sonarlint.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];
}
