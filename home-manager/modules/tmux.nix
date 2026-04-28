{...}: {
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../../dotfiles/tmux/tmux.conf;
  };

  xdg.configFile."tmux/themes".source = ../../dotfiles/tmux/themes;
}
