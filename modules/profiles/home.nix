{...}: {
  imports = [
    ./personal.nix

    ../home-manager/alacritty.nix
    ../home-manager/bat.nix
    ../home-manager/cli.nix
    ../home-manager/db.nix
    ../home-manager/fonts.nix
    ../home-manager/ghostty.nix
    ../home-manager/git.nix
    ../home-manager/golang.nix
    ../home-manager/haskell.nix
    ../home-manager/ide.nix
    ../home-manager/java.nix
    ../home-manager/k8s.nix
    ../home-manager/lsd.nix
    ../home-manager/lua.nix
    ../home-manager/nix.nix
    ../home-manager/nvim.nix
    ../home-manager/python.nix
    ../home-manager/rust.nix
    ../home-manager/scala.nix
    ../home-manager/sonarlint.nix
    ../home-manager/terraform.nix
    ../home-manager/tmux.nix
    ../home-manager/typescript.nix
    ../home-manager/zsh.nix
  ];

  xdg = {
    enable = true;
  };
}
