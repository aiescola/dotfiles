#!/bin/bash

sudo apt update 1>/dev/null
sudo apt install snapd -y

# JAVA
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ 1>/dev/null
sudo apt-get install -y software-properties-common 1>/dev/null
sudo apt-get install -y adoptopenjdk-8-openj9

# Terminal utils
sudo apt-get install mpg123
sudo apt-get install tree
sudo apt-get install ncdu
sudo apt-get install stow

# Visual Studio Code
snap install code --classic

# Android Studio
#snap install android-studio --classic

# Go
#snap install go --classic

# TODO: jenv

# Zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

chsh -s $(which zsh)


## CONFIG

sh ./scripts/setupGit 
sh ./scripts/setupLinks linux
