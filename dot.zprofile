#
# $URL$
# $Id$

echo "Loading $HOME/.zprofile"

### Select OS type

case $OSTYPE {
  sunos*)	export SYSTEM=sun ;;
  solaris*)	export SYSTEM=sol ;;
  irix*)	export SYSTEM=sgi ;;
  osf*)		export SYSTEM=dec ;;
  linux*)	export SYSTEM=gnu ;;
  freebsd*)	export SYSTEM=bsd ;;
  darwin*)	export SYSTEM=darwin ;;    # MacOSX
}

# ZDOTDIR �� zsh �θĿ�������ե������õ���ǥ��쥯�ȥ����ꤹ��

if [ -z $ZDOTDIR ]; then
  export ZDOTDIR=$HOME
fi

# �ڤ�ʬ��������ե�������ɤ߹���ǥ��쥯�ȥ����ꤹ��

export ZUSERDIR=$ZDOTDIR/.zsh


### System specific environment

# �Ķ��ѿ���PATH �ʤɡˤ� OS ������ե�������ɤ߹���

if [ -f $ZUSERDIR/zshrc.$SYSTEM ]; then
  source $ZUSERDIR/zshrc.$SYSTEM
fi

# man path
export MANPATH="/usr/share/man:/usr/X11R6/man:/usr/local/man:/var/qmail/man:$HOME/man:."


### environment variables

# ���̤���Ķ��ѿ������ꤹ��

#export LESSCHARSET=japanese-euc
export LESSCHARSET=japanese
#export LESS='-irqMM'
export LESS='-iqMM'
unset  LESSOPEN
export GZIP='-v9N'
export XMODIFIERS=@im=kinput2
#export XMODIFIERS=@im=_XWNMO



