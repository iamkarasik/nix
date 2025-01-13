# My Rose-Pine Theme
#--------------------------------------------------------------------------------------------------------------------------------------------
# Background
set -g status-style bg="#191724"
# Session name
set -g status-left "#[fg=#191724,bg=#EBBCBA,bold] #S "
# Focus
set -g window-status-current-format "#[fg=#E0DEF4,bg=#1F1D2E,bold]    #I #W "
# Unfocused
set -g window-status-format "#[fg=#6E6A86,bg=default,nobold,noitalics,nounderscore]  #{?window_last_flag,\uf7d9 , } #I #W "
# Right
set -g status-right "#[fg=#191724,bg=#EBBCBA,bold] %Y-%m-%d ❬ %H:%M:%S "
# Text between windows
set -g window-status-separator "" 
#--------------------------------------------------------------------------------------------------------------------------------------------
