#function {
#    local bracket_open='%F{black}%B[%b'
#    local bracket_close='%F{black}%B]%b'
#    local username='%(!.%F{white}%n.%F{grey}%n)' # bold if privileged
#    local at='%F{black}%B@%b' # the @, bolded
#    local machine='%F{grey}%M' # the machine name
#    local tty='%F{magenta}%y%f'
#    local history_number='%F{yellow}%h%f!' # the history number
#    local job_number='%(1j.%F{cyan}%j%f.%F{grey}%j%f)j' # the number of jobs
#    local shell_level='%F{green}%L%fL' # the shell level
#    local rc='%(?.%F{white}%?%f.%F{red}%?%f)?' # exit code of last command
#    local dir='%B%F{green}%~'
#    local thehash='%F{white}%#'
#    local reset_all='%f%b'
#
#    PROMPT="${bracket_open}${username}${at}${machine}:$tty:$history_number:${job_number}:${shell_level}:${rc}${bracket_close}
#${dir}${thehash}${reset_all} "
#
#    local paren_open='%F{black}%B(%b%f'
#    local paren_close='%F{black}%B)%b%f'
#    local date="%D{%I:%M%P %a, %b %d}"
#    RPROMPT="\$(vi_mode_prompt_info)$(git_super_status)${paren_open}${date}${paren_close}"
#}

prompt_dir() {
    echo -n '%K{green}%F{black}%~'
    echo -n '%k%F{green}\ue0b0'
}

prompt_context() {
    echo -n '%F{yellow}%K{black}\ue0b1 '
    echo -n '%(!.%F{white}%n.%n)%F{yellow}@%M'
    echo -n '%k%F{black}\ue0b0'
}

prompt_newline() {
    # strange, this cannot contain only a newline or it will not correctly
    # print in the prompt segment
    echo -n "\n%f%k"
}

prompt_hash() {
    echo -n '%F{white}%#'
}

prompt_time() {
    echo -n '%F{white}%K{black}\ue0b2%F{black}%K{white}%D{%H:%M:%S}'
}

prompt_rc() {
    local OK="%F{green}\uf00c"
    local FAIL="%F{red}\uf00d"
    local msg=${OK}
    if [ $RETVAL -gt 0 ]; then
        msg="%F{red}${RETVAL} ${FAIL}"
    fi
    echo -n "%F{black}\ue0b2%K{black} ${msg} "
}

do_prompt() {
    RETVAL=$?
    PROMPT='$(prompt_context)$(prompt_newline)$(prompt_dir)%f%k%b '
    RPROMPT='$(prompt_rc)$(prompt_time)'
}

function {
    autoload -Uz add-zsh-hook
    add-zsh-hook precmd do_prompt
}
