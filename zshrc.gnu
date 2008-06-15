#
# $URL$
# $Id$

echo "Loading $HOME/.zsh/zshrc.gnu"

export EDITOR=vi

# lang
#export LANG=ja_JP.ujis

# for jman
#export LC_CTYPE=ja_JP.ujis

alias ls='ls --color'
alias ee='nano -w'

alias tf='tail -n 0 -f'
alias top='top -d 1 -i'
alias iptables_ls='iptables -L -vn --line-numbers'
