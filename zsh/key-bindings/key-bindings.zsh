# Based on:
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh

# Updates editor information when the keymap changes.
function zle-keymap-select() {
    zle reset-prompt
    zle -R
}

# Ensure that prompt is redrawn when the terminal size changes.
TRAPWINCH() {
    zle && zle -R
}

zle -N zle-keymap-select
zle -N edit-command-line

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init() {
        echoti smkx
    }
    function zle-line-finish() {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

stty -ixon -ixoff


bindkey -v

# use ^k to enter vi-cmd-mode
bindkey '^k' vi-cmd-mode

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
# NOTE: the vi- variants of these (default) won't go past where insert mode was entered
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^k^b' backward-delete-word
bindkey '^k^w' delete-word

# kill a line
bindkey '^u' kill-whole-line
bindkey '^k^k' kill-line

# vi- style movement
bindkey '^b' vi-backward-word
bindkey '^w' vi-forward-word

# home / end
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
if [[ -n "${terminfo[khome]}" ]]; then
    bindkey "${terminfo[khome]}" beginning-of-line
fi
if [[ -n "${terminfo[kend]}" ]]; then
    bindkey "${terminfo[kend]}" end-of-line
fi

# perform history expansion (! or ^) on space
bindkey ' ' magic-space

autoload -Uz edit-command-line
# allow v to edit the command line (standard behavior)
bindkey -M vicmd 'v' edit-command-line
# also allow ^k^e in viins mode
bindkey '^k^e' edit-command-line


if [[ "$MODE_INDICATOR" == "" ]]; then
  #MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
  MODE_INDICATOR="%F{red}%B[ins]%f%b"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}
