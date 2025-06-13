#!/bin/bash
set -euxo pipefail

USER="robindiddams"
HOME="/home/$USER"
ALIAS_FILE="$HOME/.bash_aliases"

apt update && apt install -y htop curl vim figlet fastfetch
mkdir -p $HOME/.ssh

# check if authorized_keys exists and if not create it as user
if [ ! -f $HOME/.ssh/authorized_keys ]; then
	touch $HOME/.ssh/authorized_keys
	chown $USER:$USER $HOME/.ssh/authorized_keys
fi
curl https://github.com/$USER.keys >> $HOME/.ssh/authorized_keys

# check if this string is already in the sudoers file
if ! grep -q "$USER ALL=(ALL) NOPASSWD: ALL" /etc/sudoers; then
	echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
fi

# set the motd
hostname | figlet -f smslant > /etc/motd

# check if bash aliases exists and if not create it as user
if [ ! -f $ALIAS_FILE ]; then
	touch $ALIAS_FILE
	chown $USER:$USER $ALIAS_FILE
fi

# aliases as a multiline string
cat << EOF >> $ALIAS_FILE
alias ll="ls -la"
alias vi="vim"
EOF
