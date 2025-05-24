rec {
  enable = true;
  dotDir =  ".config/zsh";

  history = {
    save = 100000;
    size = 100000;
    path = "$HOME/.cache/zsh_history";
  };

  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  enableCompletion = true;

  initContent = ''
    # PROMPT
    autoload -U colors && colors
    source ${./themes/robbyrussel.zsh-theme}
    setopt prompt_subst

    # PLUGINS
    source ${./plugins/git-aliases.zsh}
    source ${./plugins/git.zsh}
    source ${./plugins/zsh-vi-mode.zsh}
    source ${./plugins/zsh-fzf-history-search.zsh}

    # CONFIG
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Ignore case for tab completion
    bindkey "^[[1;5C" forward-word # Enable ctrl-right in terminal
    bindkey "^[[1;5D" backward-word # Enable ctrl-left in terminal
    bindkey "^A" vi-beginning-of-line # Go to start
    bindkey "^E" vi-end-of-line # Go to end

    # Aliases
    source ${./aliases/k8s.sh}

    # WORK-ALIASES
    [[ -f ~/.extrarc ]] && source ~/.extrarc
  '';
}
