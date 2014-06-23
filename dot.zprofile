#

echo "Loading $HOME/.zprofile"

if [ -z $ZDOTDIR ]; then
  export ZDOTDIR=$HOME
fi

export ZUSERDIR=$ZDOTDIR/.zsh

# man path
export MANPATH="/usr/share/man:/usr/local/share/man:/usr/X11R6/man:/usr/local/man:$HOME/man:."

### System specific environment

### Select OS type

case $OSTYPE {
  sunos*)	export SYSTEM=sun ;;
  solaris*)	export SYSTEM=sol ;;
  irix*)	export SYSTEM=sgi ;;
  osf*)		export SYSTEM=dec ;;
  linux*)	export SYSTEM=gnu ;;
  freebsd*)	export SYSTEM=bsd ;;
  openbsd*)	export SYSTEM=bsd ;;
  darwin*)	export SYSTEM=darwin ;;    # MacOSX
}

if [ -f $ZUSERDIR/zshrc.$SYSTEM ]; then
  source $ZUSERDIR/zshrc.$SYSTEM
fi

# EOF
