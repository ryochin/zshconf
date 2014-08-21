#

# comment for rsync auto login.
#echo "Loading $HOME/.zshenv"

### env

# default prompt

if [ $UID = 0 ]; then
	PROMPT="%BROOT%b@%l'%U%m%u %4~ %# "
else
	PROMPT="%n@%l'%U%m%u: %4~ %# "
fi

RPROMPT='   %D{%Y.%m.%d %a %H:%M:%S}'
SPROMPT='zsh: replace '\''%R'\'' to '\''%r'\'' ? [Yes/No/Abort/Edit] '

# term
TERM=xterm-color

# mail
#MAILPATH=$HOME/Maildir
#MAILCHECK=120

# surpress perl warnings
export PERL_BADLANG=0
export PERLDOC_PAGER=${PAGER}

### path setting

path=($path $HOME/bin)
path=($path /usr/local/bin /usr/local/sbin /usr/local/libexec)
path=($path /usr/bin /usr/sbin /usr/libexec)

# X
if [ -x /usr/X11R6/bin/X ]; then
	export X11HOME=/usr/X11R6
	path=($path $X11HOME/bin $X11HOME/libexec)
fi

# apache
if [ -x /usr/local/apache/bin ]; then
	path=($path /usr/local/apache/bin)
fi

# namazu
if [ -x /usr/local/namazu/bin ];then
	path=($path /usr/local/namazu/bin)
fi

# samba
if [ -x /usr/local/samba/bin ]; then
	path=($path /usr/local/samba/bin)
fi

# ssl
if [ -x /usr/local/ssl ]; then
	path=($path /usr/local/ssl/bin)
fi

# pg
if [ -x /usr/local/pgsql/bin ]; then
	path=($path /usr/local/pgsql/bin)
fi

# mysql
if [ -x /usr/local/mysql/bin ]; then
	path=($path /usr/local/mysql/bin /usr/local/mysql/libexec)
fi

# qmail
if [ -x /var/qmail/bin ]; then
	path=($path /var/qmail/bin)
fi

# proftpd
if [ -x /usr/local/proftpd/sbin ]; then
	path=($path /usr/local/proftpd/sbin)
fi

# majordomo
if [ -x /usr/local/majordomo/bin ]; then
	path=($path /usr/local/majordomo/bin)
fi

# tetex
if [ -x /usr/local/teTeX/bin ]; then
	path=($path /usr/local/teTeX/bin)
fi

# java
if [ -x /usr/java/bin ]; then
	path=($path /usr/java/bin)
fi

# squid
if [ -x /usr/local/squid ]; then
	path=($path /usr/local/squid/bin /usr/local/squid/sbin /usr/local/squid/libexec)
	manpath=($manpath /usr/local/squid/share/man)
fi

# EOF
