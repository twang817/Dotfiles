export FZF_TMUX=1
export FZF_DEFAULT_OPTS="--inline-info"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# TODO: put this somewhere
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# https://gist.githubusercontent.com/phha/cb4f4bb07519dc494609792fb918e167/raw/e6d095b57356a38b5602903ba29d82f99b50bc1d/gi
# moar: https://github.com/junegunn/fzf/wiki/examples
# https://junegunn.kr/2016/07/fzf-git/
# changyuheng/zsh-interactive-cd
