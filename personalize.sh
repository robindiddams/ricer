#!/bin/bash

sudo apt update && sudo apt install htop curl vim
mkdir -p $HOME/.ssh
curl https://github.com/robindiddams.keys >> $HOME/.ssh/authorized_keys

