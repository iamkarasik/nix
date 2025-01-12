pkgs: {
  enable = true;
  escapeTime = 300;
  keyMode = "vi";
  shortcut = "a";
  clock24 = true;
  historyLimit = 1000000;
  extraConfig = ''
    set-option -g status-position top

    # Enable going to beginning of line
    bind C-a send-prefix

    # Update clock every second
    set -g status-interval 1

    # Resize pane using prefix-{h,j,k,l}
    bind -r C-k resize-pane -U
    bind -r C-j resize-pane -D
    bind -r C-h resize-pane -L
    bind -r C-l resize-pane -R

    # Switch pane using {h,j,k,l}
    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R

    set -g default-terminal "xterm-256color"
    set -ag terminal-overrides ",xterm-256color:RGB"

    set -g default-command ${pkgs.zsh}/bin/zsh

    source-file ~/.config/home-manager/config/tmux/themes/vscode.sh
  '';
}
