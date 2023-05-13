#!/bin/bash

sudo apt update 1>/dev/null

# JAVA
wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add - 
sudo add-apt-repository --yes 'deb https://apt.corretto.aws stable main' 1>/dev/null
sudo apt-get update; sudo apt-get install -y java-17-amazon-corretto-jdk

# Terminal utils
sudo apt-get install mpg123
sudo apt-get install tree
sudo apt-get install ncdu
sudo apt-get install stow

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Zim
wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

## CONFIG

export _git_email=basch92@gmail.com
export _git_user=aiescola
export _platform_folder=linux
#export _platform_folder=regolith

sh ./scripts/setupGit 
sh ./scripts/setupLinks
