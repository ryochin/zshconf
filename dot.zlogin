#

echo "Loading $HOME/.zlogin"

# clean this display up
clear

# wipe out dead screens
if [ -f /usr/local/bin/screen ]; then
  screen -q -wipe
fi

# display (or not) messages from other users
mesg y

# mail notification
#if [ `which biff` ]; then
#  biff y
#fi

# show system status
uptime
echo '------------------------'
echo "Welcome to '${HOST}' !"
#echo "\t-> OS is `uname -rs`."
perl -e 'chomp($u=qx(uname -rs));printf "\t-> OS is %s.\n", $u'
#perl -e '($t=qx(ac))=~s/^.*?(\d+?)\..*?$/$1/;printf"\t-> Your total login time is about %d day %d hrs.\n",int($t/24),int($t%24)'
echo '------------------------'
who | sort
echo '------------------------'

# mail
#if [ `which from` ]; then
#  from -c
#fi

# launch ssh-agent1
#eval `ssh-agent`
#ssh-add ~/.ssh/id_dsa

# welcome message
echo ''
echo "*** How are you today, I'm ready to go. :-) ***"
echo ''

# not in use
#stty dec new cr0 -tabs
#ttyctl -f  # freeze the terminal modes... can't change without a ttyctl -u

