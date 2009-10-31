#
# $URL$
# $Id$

echo "Loading $HOME/.zsh/zshrc.gnu"

alias ls='ls --color'

alias tf='tail -n 0 -f'
alias top='top -d 1 -i'
alias iptables_ls='iptables -L -vn --line-numbers'
alias md5=md5sum

alias low='ionice -c2 -n7 nice -10'
