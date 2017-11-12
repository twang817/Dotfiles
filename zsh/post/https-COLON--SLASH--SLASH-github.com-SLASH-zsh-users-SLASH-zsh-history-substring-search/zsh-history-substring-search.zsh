bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
if [[ -n "$terminfo[kcuu1]" ]]; then
    bindkey -M emacs "$terminfo[kcuu1]" history-substring-search-up
    bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up
    bindkey -M vicmd "$terminfo[kcuu1]" history-substring-search-up
fi
if [[ -n "$terminfo[kcud1]" ]]; then
    bindkey -M emacs "$terminfo[kcud1]" history-substring-search-down
    bindkey -M viins "$terminfo[kcud1]" history-substring-search-down
    bindkey -M vicmd "$terminfo[kcud1]" history-substring-search-down
fi
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
