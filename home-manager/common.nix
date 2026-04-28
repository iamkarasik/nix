{...}: {
  imports = [
    ./modules/alacritty.nix
    ./modules/cli.nix
    ./modules/db.nix
    ./modules/git.nix
    ./modules/golang.nix
    ./modules/haskell.nix
    ./modules/ide.nix
    ./modules/java.nix
    ./modules/k8s.nix
    ./modules/lsd.nix
    ./modules/lua.nix
    ./modules/nix.nix
    ./modules/nvim.nix
    ./modules/python.nix
    ./modules/rust.nix
    ./modules/scala.nix
    ./modules/sonarlint.nix
    ./modules/tmux.nix
    ./modules/typescript.nix
    ./modules/zsh.nix
  ];

  xdg = {
    enable = true;
  };
}
