#!bin/sh

sudo apt update 1>/dev/null
sudo apt install snapd -y

sudo apt install git -y

# JAVA
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ 1>/dev/null
sudo apt-get install -y software-properties-common 1>/dev/null
sudo apt-get install -y adoptopenjdk-8-openj9 

# Visual Studio Code
snap install code --classic

# Android Studio
snap install android-studio --classic 

# Go
snap install go --classic

# Zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
