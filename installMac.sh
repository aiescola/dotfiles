#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# JAVA
JAVA_JDK11=javajdk.pkg
JAVA_JDK17=javajdk17.pkg

curl -o $JAVA_JDK11 -LO https://corretto.aws/downloads/latest/amazon-corretto-11-x64-macos-jdk.pkg
curl -o $JAVA_JDK17 -LO https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.tar.gz
sudo installer -pkg ./$JAVA_JDK11 -target /
sudo installer -pkg ./$JAVA_JDK17 -target /
rm $JAVA_JDK11 $JAVA_JDK17

# Terminal utils
brew install mpg123
brew install tree
brew install ncdu
brew install stow

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

brew install jenv
jenv enable-plugin export
jenv add /Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
jenv add /Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home

brew install nvm

# INTELLIJ IDEA CE
#brew install --cask intellij-idea-ce

# VISUAL STUDIO CODE
brew install --cask visual-studio-code

# FORK
brew install --cask fork

# Vagrant
# brew install vagrant

# VirtualBox
# brew install virtualbox

# Zim
wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

# CONFIG

export _git_email=aitor.escolar@galpsolar.com
export _git_user=aitor.escolar
export _platform_folder=macos

sh ./scripts/setupGit
sh ./scripts/setupLinks
