{config, ...}: {
  programs.zsh = {
    enable = true;
    dotDir = config.xdg.configHome + "/zsh";

    history = {
      save = 100000;
      size = 100000;
      path = config.xdg.cacheHome + "/zsh_history";
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    initContent = ''
      autoload -U colors && colors
      source ${./themes/robbyrussel.zsh-theme}
      setopt prompt_subst

      source ${./plugins/git-aliases.zsh}
      source ${./plugins/git.zsh}
      source ${./plugins/zsh-fzf-history-search.zsh}
      source ${./plugins/zsh-fzf-search.zsh}

      autoload -z edit-command-line
      zle -N edit-command-line
      bindkey "^X^E" edit-command-line

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey "^A" vi-beginning-of-line
      bindkey "^E" vi-end-of-line

      source ${./aliases/k8s.sh}
      [[ -f ~/.extrarc ]] && source ~/.extrarc
    '';
  };
}
