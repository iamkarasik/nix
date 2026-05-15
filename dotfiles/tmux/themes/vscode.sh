# My VSCode Theme
# Palette
#   bg          #1E1E1E  status bar / "vscode dark"
#   accent      #608B4E  vscode green
#   muted       #6E6E6E  inactive fg
#   inactive-bg #2D2D2D  inactive tab pill
#   fg          #D4D4D4  default fg
# Nerd Font icons:  apple    linux    calendar    clock    right    left
#--------------------------------------------------------------------------------------------------------------------------------------------
# Icons set once at config-load
if-shell '[ "$(uname)" = "Darwin" ]' \
  'set-option -g @os_icon ""' \
  'set-option -g @os_icon ""'
set -g @cal_icon ""
set -g @clock_icon ""

# Status bar
set -g status-style "bg=#1E1E1E,fg=#D4D4D4"

# Left:
#   OS icon (green on bar, flush)
#   bg-colored arrow into the green pill (dark triangle on green = diagonal cut from bar to pill)
#   session name (green pill, dark fg, bold)
#   green arrow out of the pill
#   black arrow on bar (decorative shadow)
set -g status-left "#[fg=#608B4E,bg=#1E1E1E]#{@os_icon} #[fg=#1E1E1E,bg=#608B4E]#[fg=#1E1E1E,bg=#608B4E,bold] #S #[fg=#608B4E,bg=#1E1E1E]"
set -g status-left-length 60

# Windows: pill with no left shaping, right arrow exit only
# Active: green pill
set -g window-status-current-format "#[fg=#1E1E1E,bg=#608B4E]#[fg=#1E1E1E,bg=#608B4E] #I:#W #[fg=#608B4E,bg=#1E1E1E]"
# Inactive: subtle dark pill (#2D2D2D)
set -g window-status-format "#[fg=#1E1E1E,bg=#2D2D2D]#[fg=#D4D4D4,bg=#2D2D2D] #I:#W #[fg=#2D2D2D,bg=#1E1E1E]"

set -g window-status-separator ""

# Right: flat clock, then date pill with left-pointing arrow head
set -g status-right "#[fg=#608B4E,bg=#1E1E1E] #{@clock_icon} %H:%M:%S #[fg=#608B4E,bg=#1E1E1E]#[fg=#1E1E1E,bg=#608B4E] #{@cal_icon} %Y-%m-%d "
set -g status-right-length 80

# Pane borders pick up the accent
set -g pane-border-style "fg=#3A3A3A"
set -g pane-active-border-style "fg=#608B4E"

# Command/message prompt matches the accent
set -g message-style "bg=#608B4E,fg=#1E1E1E"
set -g message-command-style "bg=#608B4E,fg=#1E1E1E"
#--------------------------------------------------------------------------------------------------------------------------------------------
