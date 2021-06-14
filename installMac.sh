#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# JAVA
JAVA_JDK11=javajdk.pkg
JAVA_JDK8=javajdk8.pkg

curl -o $JAVA_JDK11 -LO https://corretto.aws/downloads/latest/amazon-corretto-11-x64-macos-jdk.pkg
curl -o $JAVA_JDK8 -LO https://corretto.aws/downloads/latest/amazon-corretto-8-x64-macos-jdk.pkg
sudo installer -pkg ./$JAVA_JDK11 -target /
sudo installer -pkg ./$JAVA_JDK8 -target /
rm $JAVA_JDK11 $JAVA_JDK8

# Terminal utils
brew install mpg123
brew install tree
brew install ncdu
brew install stow

brew install jenv
jenv enable-plugin export
jenv add /Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
jenv add /Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home

brew install nvm

# INTELLIJ IDEA CE
#brew install --cask intellij-idea-ce

# VISUAL STUDIO CODE
brew install --cask visual-studio-code

# FORK
brew install --cask fork

# OH MY ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# CONFIG

sh ./scripts/setupGitWork
sh ./scripts/setupMacLinks
