#!/usr/bin/env bash

# -------- BREW --------
if ! command -v brew >/dev/null 2>&1; then
    echo "---- INSTALLING HOMEBREW ----"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# SDKMAN installation
if [ ! -d "$HOME/.sdkman" ]; then
    echo "---- INSTALLING SDKMAN ----"
    curl -s "https://get.sdkman.io" | bash
fi

if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

if command -v sdk >/dev/null 2>&1; then
    if ! sdk list java | grep -q "17.*installed"; then
        echo "---- INSTALLING JAVA 17 (SDKMAN) ----"
        sdk install java 17-tem
    fi

    sdk default java 17-tem
fi


# -------- TERMINAL UTILS --------
install_brew() {
    if ! brew list "$1" >/dev/null 2>&1; then
        echo "---- INSTALLING $1 ----"
        brew install "$1"
    fi
}

for pkg in mpg123 tree ncdu stow fzf; do
    install_brew "$pkg"
done


# -------- CASKS --------

install_cask() {
    if ! brew list --cask "$1" >/dev/null 2>&1; then
        echo "---- INSTALLING CASK $1 ----"
        brew install --cask "$1"
    fi
}

install_cask visual-studio-code
install_cask fork
install_cask intellij-idea-ce
#install_cask nvm

# -------- ZIM --------

if [ ! -d "$HOME/.zim" ]; then
    echo "---- INSTALLING ZIM ----"
    curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
fi