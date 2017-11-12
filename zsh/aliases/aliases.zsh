alias ls=' ls --color=tty'
alias l='ls -lFh'
alias la='ls -lAFh'
alias lr='ls -tRFh'
alias lt='ls -ltFh'
alias ll='ls -l'
alias ldot='l -d .*'
alias lsd='l -ld'

alias cd=' cd'

alias grep='grep -n --perl-regexp --color=always --binary-files=without-match --exclude-dir={.git,.svn}'
function grb() {
    grep -R "\b$@\b"
}

alias dud='du -d 1 -h | sort -h'
alias duf='du -sh * | sort -h'

alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias ffs='find . -type f -name ".*.swp"'

alias h='history'
alias hgrep='fc -El 0 | grep'

alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
alias mkdir='nocorrect mkdir'
alias rmdir='nocorrect rmdir'

alias less='less -R'

# virtualenv
function seba() {
    local hint=${1-env}
    if [ -f $hint/bin/activate ]; then
        source $hint/bin/activate
    else
        for e in */bin/activate; do
            if [[ $e =~ "$hint" ]]; then
                source $e
                return
            fi
        done
        echo "Could not find a virtualenv matching $hint"
    fi
}

alias sebd='deactivate'
function sebv() {
    local n=${1-env}
    if [ ! -f $n/bin/activate ]; then
        virtualenv $n
    fi
    source $n/bin/activate
}

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# a single -
alias -- -='cd -'

# docker
alias drmi='docker images -qf dangling=true |xargs docker rmi'
alias drmc='docker ps -aqf status=exited |xargs docker rm'
alias dvls='docker volume ls'

# ansible-vault
function avt() {
    ansible-vault edit $1 --vault-password-file=~/.vault_pass.txt
}

function ave() {
    ansible-vault encrypt $* --vault-password-file=~/.vault_pass.txt
}

function avd() {
    ansible-vault decrypt $* --vault-password-file=~/.vault_pass.txt
}

# git move to branch
function gmtb() {
    [ -z "$1" ] && {
        echo "no branch specified"
        return
    }
    local branch=$(git rev-parse --abbrev-ref HEAD)
    local reply
    echo -n "move changes from $branch to $1 [Yn]: "
    read reply
    case "$reply" in
        Nn) ;;
        *)
            git co -b $1
            git push origin HEAD
            git co $branch
            git reset --hard origin/$branch
            git co $1
            ;;
    esac
}

# brew list dependencies
function brew_deps() {
    brew list | while read cask; do echo -n $fg[blue] $cask $fg[white]; brew deps $cask | awk '{printf(" %s ", $0)}'; echo ""; done
}
