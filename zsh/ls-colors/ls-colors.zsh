autoload -Uz colors && colors

export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;00:cd=40;33;00:or=40;31;00:ex=00;32:*.tar=00;31:*.tgz=00;31:*.rar=00;31:*.ace=00;31:*.zip=00;31:*.bz2=00;31:*.rpm=00;31:*.gz=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.png=00;35:*.tga=00;35:*.xpm=00;35:*.mpg=00;37:*.avi=00;37:*.mov=00;37:*.mp3=01;35:*.flac=01;35:*.ogg=01;35:*.mpc=01;35:*.wav=01;35:*.ape=01;35:*.core=00;33'

function list-colors() {
    local key
    for key in ${(k)fg}; do
        echo ${fg[$key]}${key} ${fg_bold[$key]}bold${reset_color}
    done
}

