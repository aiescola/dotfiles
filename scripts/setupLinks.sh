#!/bin/bash

stow base
stow ${_platform_folder}

{
    echo '#### PERSONAL CONFIGURATION ####'
    echo 'for f in ~/.bash/*; do source $f; done'
    echo ''
    echo 'LOCAL_BIN="$HOME/.local/bin"'
    echo 'SCRIPTS_FOLDER="$HOME/.scripts"'
    echo 'export PATH=$PATH:$LOCAL_BIN:$SCRIPTS_FOLDER'
    echo ''
} >> ~/.zshrc