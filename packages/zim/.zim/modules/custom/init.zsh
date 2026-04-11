if [ -d "$HOME/.shell" ]; then
    for f in "$HOME"/.shell/*.sh; do
        [ -r "$f" ] && source "$f"
    done
fi

export PATH="$PATH:$HOME/.local/bin:$HOME/.scripts"

source "${0:A:h}/sdkman.zsh"