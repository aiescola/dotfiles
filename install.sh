#!/usr/bin/env bash
set -euo pipefail

echo "---- APPLYING DOTFILES ----"

# -------- STOW --------
echo "---- STOW PACKAGES ----"
stow packages/git
stow packages/shell
stow packages/zim

# -------- GIT SETUP --------
echo "---- SETUP GIT ----"
./scripts/setup_git.sh

# -------- ZIM --------
if [ -d "$HOME/.zim" ]; then
    echo "---- ZIM READY ----"
else
    echo "Zim not installed, run bootstrap or install zim."
fi
echo "---- DONE ----"