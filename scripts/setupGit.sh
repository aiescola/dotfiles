#!/bin/bash

if [ -z "$(git config --global --get user.email)" ]; then
    read -p "Git email: " email
    git config --global user.email "$email"
fi

if [ -z "$(git config --global --get user.name)" ]; then
    read -p "Git user: " name
    git config --global user.name "$name"
fi
