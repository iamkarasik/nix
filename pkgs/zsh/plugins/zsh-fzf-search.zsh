ZSH_FZF_SEARCH_KEYBIND='^g'
ZSH_FZF_SEARCH_DIRS_ENABLE=1
ZSH_FZF_SEARCH_PREVIEW_ENABLE=1
ZSH_FZF_SEARCH_PREVIEW_CMD='bat --color=always {}'
ZSH_FZF_SEARCH_EXCLUDES=(
  .git 
  node_modules
  dist
)

fzf_search() {
  local args=(-t f)
  [[ "$ZSH_FZF_SEARCH_DIRS_ENABLE" == 1 ]] && args+=(-t d)

  local excludes=()
  for e in "${ZSH_FZF_SEARCH_EXCLUDES[@]}"; do
    excludes+=(--exclude "$e")
  done

  local preview_arg=()
  if [[ "$ZSH_FZF_SEARCH_PREVIEW_ENABLE" == 1 ]]; then
    preview_arg=(--preview "$ZSH_FZF_SEARCH_PREVIEW_CMD")
  fi

  fd "${args[@]}" "${excludes[@]}" "$@" | fzf "${preview_arg[@]}"
}

fzf_search_widget() {
  local selection
  selection=$(fzf_search) || return

  if [[ -d "$selection" ]]; then
    cd "$selection"
  else
    ${EDITOR:-vi} "$selection"
  fi

  zle reset-prompt
}

autoload fzf_search
zle -N fzf_search_widget

bindkey $ZSH_FZF_SEARCH_KEYBIND fzf_search_widget
