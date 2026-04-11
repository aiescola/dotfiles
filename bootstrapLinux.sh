#!/usr/bin/env bash

# -------- DETECT OS --------
. /etc/os-release

if [[ "$ID" == "arch" || "$ID_LIKE" == *"arch"* ]]; then
    PKG_MANAGER="pacman"
elif [[ "$ID_LIKE" == *"debian"* || "$ID" == "debian" || "$ID" == "ubuntu" || "$ID" == "linuxmint" ]]; then
    PKG_MANAGER="apt"
else
    echo "Unsupported OS: $ID"
    exit 1
fi

update_system() {
    case "$PKG_MANAGER" in
        apt)
            sudo apt-get update -y 1>/dev/null
            ;;
        pacman)
            sudo pacman -Syu --noconfirm
            ;;
    esac
}

command_exists () {
    command -v "$1" >/dev/null 2>&1
}

install_pkg () {
    case "$PKG_MANAGER" in
        apt)
            sudo apt-get install -y "$1" -qq >/dev/null
            ;;
        pacman)
            sudo pacman -S --noconfirm --needed "$1"
            ;;
    esac
}

update_system

# Terminal utils
for pkg in zsh mpg123 tree ncdu stow; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        echo "---- INSTALLING $pkg ----"
        install_pkg "$pkg"
    fi
done

# fzf
if [ ! -d "$HOME/.fzf" ]; then
    echo "---- INSTALLING FZF ----"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all 1>/dev/null
fi

# Zim
if [ ! -d "$HOME/.zim" ]; then
    echo "---- INSTALLING ZIM ----"
    wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
    chsh -s $(which zsh) # Zim tries to update it but some distros return authentication error.
fi

# SDKMAN
if [ ! -d "$HOME/.sdkman" ]; then
    echo "---- INSTALLING SDKMAN ----"
    wget -nv -O "https://get.sdkman.io" | bash
fi

# -------- CONTAINER ENGINE --------

if ! command -v podman >/dev/null 2>&1; then
    echo "---- INSTALLING PODMAN ----"
    install_pkg podman
    install_pkg podman-docker
    install_pkg podman-compose
fi