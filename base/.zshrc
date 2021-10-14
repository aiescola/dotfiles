source ~/.bash/platformConfig

ADB_HOME="$HOME/Android/Sdk/platform-tools"
GOPATH="$HOME/go"
LOCAL_BIN="$HOME/.local/bin"
SCRIPTS_FOLDER="$HOME/.scripts"

export PATH=$PATH:$ADB_HOME:$LOCAL_BIN:$SCRIPTS_FOLDER:$PLATFORM_PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="amuse-aitor"

eval "$(jenv init -)"


# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=21

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git gradle)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

for f in ~/.bash/*; do source $f; done
