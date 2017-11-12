# changing directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent

# completion
setopt complete_in_word
setopt glob_complete
setopt no_list_beep

# expansion and globbing
setopt extended_glob
setopt nonomatch

# history
setopt append_history
setopt extended_history
setopt no_hist_beep
setopt hist_fcntl_lock
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt inc_append_history

# input/output
setopt interactive_comments
setopt no_flow_control
setopt no_hup

# prompting
setopt prompt_subst
setopt transient_rprompt

# zle
setopt no_beep
