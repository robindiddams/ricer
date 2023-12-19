#!/bin/bash
set -euxo pipefail

USER="robindiddams"
HOME="/home/$USER"

apt update && apt install htop curl vim figlet
mkdir -p $HOME/.ssh
curl https://github.com/$USER.keys >> $HOME/.ssh/authorized_keys
echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
hostname | figlet -f smslant > /etc/motd

echo "alias ll=\"ls -la\"" >> $HOME/.bash_aliases


