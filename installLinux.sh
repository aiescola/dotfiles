#!/bin/bash

sudo apt update 1>/dev/null

# JAVA
if ! which java > /dev/null; then
    echo ""
    echo "---- INSTALLING JAVA ----"
    echo ""
    wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add - 
    sudo add-apt-repository --yes 'deb https://apt.corretto.aws stable main' 1>/dev/null
    sudo apt-get update; sudo apt-get install -y java-21-amazon-corretto-jdk
fi

# Terminal utils
echo ""
echo "---- INSTALLING TERMINAL UTILS ----"
echo ""
sudo apt-get install -y mpg123 1>/dev/null
sudo apt-get install -y tree 1>/dev/null
sudo apt-get install -y ncdu 1>/dev/null
sudo apt-get install -y stow 1>/dev/null

if ! which zsh > /dev/null; then
    echo ""
    echo "---- INSTALLING ZSH ----"
    echo ""
	sudo apt-get install -y zsh 1>/dev/null
fi

# fzf
echo ""
echo "---- INSTALLING FZF ----"
echo ""
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all 1>/dev/null

# Zim
echo ""
echo "---- INSTALLING ZIM ----"
echo ""
wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
chsh -s $(which zsh) # Zim tries to update it but some distros return authentication error.

## CONFIG

export _git_email=aitorescolarcabeza@gmail.com
export _git_user=aescolar
export _platform_folder=linux

sh ./scripts/setupGit 
sh ./scripts/setupLinks
