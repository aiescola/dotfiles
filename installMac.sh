#!/bin/bash

if ! which brew > /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# SDKMAN installation
if ! which sdk > /dev/null; then
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# JAVA
if ! which java > /dev/null; then
    JAVA_JDK11=javajdk.pkg
    JAVA_JDK17=javajdk17.pkg

    curl -o $JAVA_JDK11 -LO https://corretto.aws/downloads/latest/amazon-corretto-11-x64-macos-jdk.pkg
    curl -o $JAVA_JDK17 -LO https://corretto.aws/downloads/latest/amazon-corretto-17-x64-macos-jdk.pkg
    
    sudo installer -pkg ./$JAVA_JDK11 -target /
    sudo installer -pkg ./$JAVA_JDK17 -target /
    rm $JAVA_JDK11 $JAVA_JDK17

    sdk install java 11-amzn /Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
    sdk install java 17-amzn /Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home
    sdk default java 17-amzn
fi

# Terminal utils
brew install mpg123 tree ncdu stow

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

#brew install nvm

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
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

# CONFIG

export _git_email=aitorescolarcabeza@gmail.com
export _git_user=aescolar
export _platform_folder=macos

sh ./scripts/setupGit.sh
sh ./scripts/setupLinks.sh
