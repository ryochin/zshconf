#

echo "Loading $HOME/.zshrc"

### style

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

### shell variables

# history

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=256
SAVEHIST=512
if [ $UID = 0 ]; then
    unset HISTFILE
    SAVEHIST=0
fi

# show other's login/logout

WATCH=notme

# core file size
unlimit
limit core 0
limit -s

# default mode
umask 022

# Ctrl+H to erace etc.
stty erase '^H'
stty intr '^C'
stty susp '^Z'

### key bindings

# emacs like
bindkey -e				# EDITOR=vi -> bindkey -v
#bindkey -v                              # EDITOR=vi -> bindkey -v

bindkey '^U' backward-kill-line		# override kill-whole-line
bindkey '^W' kill-region		# override backward-kill-word
bindkey '^[h' vi-backward-kill-word	# override run-help
bindkey '^[.' copy-prev-word		# override insert-last-word

# use ctrl instead of esc
bindkey '^B' backward-word
bindkey '^F' forward-word

### parts

if [ -f $ZUSERDIR/zshoptions ]; then
  source $ZUSERDIR/zshoptions
fi

if [ -f $ZUSERDIR/completions ]; then
  source $ZUSERDIR/completions
fi

fpath=(/usr/local/share/zsh/site-functions(N-/) ${fpath})
autoload -U compinit ; compinit

if [ -f $ZUSERDIR/aliases ]; then
  source $ZUSERDIR/aliases
fi

if [ -f $ZUSERDIR/functions ]; then
  source $ZUSERDIR/functions
fi

if [ -f $ZUSERDIR/lscolors ]; then
  source $ZUSERDIR/lscolors
fi

# your settings
if [ -f $ZUSERDIR/zshrc.user ]; then
  source $ZUSERDIR/zshrc.user
fi

if [ -f $ZUSERDIR/zshrc.user.git ]; then
  source $ZUSERDIR/zshrc.user.git
fi
