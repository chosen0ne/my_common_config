# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export GOROOT=/usr/local/go
export GOPATH=/Users/louzhenlin/dev/workspace/go/

# APP HOME
export NSQHOME="/Users/louzhenlin/dev/server/nsq-0.2.31.darwin-amd64.go1.3.1"
export NODEHOME="/Users/louzhenlin/dev/app/node-v0.10.32-darwin-x64"
export REDISHOME="/Users/louzhenlin/dev/server/redis-2.8.17"

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:$NSQHOME/bin:$NODEHOME/bin:$REDISHOME/bin
export PATH=/Users/louzhenlin/dev/app/ctags-5.8/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad

export C_INCLUDE_PATH=/Users/louzhenlin/dev/workspace/c_cpp/leveldb/include/
export CPLUS_INCLUDE_PATH=/Users/louzhenlin/dev/workspace/c_cpp/leveldb/include/
export PKG_CONFIG_PATH=/usr/local/Cellar/pkg-config/0.28/bin/pkg-config

# MANPATH
LOCAL_MANPATH="/Users/louzhenlin/dev/man"
# export MANPATH="$LOCAL_MANPATH:/usr/local/man:/usr/local/man:/usr/X11/man"

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ll="ls -al"
alias grep="grep --color"

alias g108="ssh root@202.205.91.108"
alias g107="ssh root@202.205.91.107"

# edit and source private config
alias erc="vim ~/.zshrc"
alias src="source ~/.zshrc"

# alias for man
alias manlocal="man -M $LOCAL_MANPATH"
alias addman="cp -a man/* $LOCAL_MANPATH"

# user macvim
alias vi="/usr/local/Cellar/macvim/HEAD/MacVim.app/Contents/MacOS/Vim"
alias vim="/usr/local/Cellar/macvim/HEAD/MacVim.app/Contents/MacOS/Vim"

# handy tools
alias cwd="pwd | pbcopy"

source /Users/louzhenlin/dev/tools/z/z.sh

# functions
# compile leveldb app
function mklvdb() {
    g++ -o $2 $1 /Users/louzhenlin/dev/workspace/c_cpp/leveldb/libleveldb.a -I/Users/louzhenlin/dev/workspace/c_cpp/leveldb/include -lpthread
}

# init workspace for go
function goworkspace() {
    echo "init go workspace..."

    mkdir src
    echo "finish creation of src"

    mkdir pkg
    echo "finish creation of pkg"

    mkdir bin
    echo "finish creation of bin"
}

# calc code lines for C
function clines() {
    cc_line=`find . -name '*.c' | xargs grep -v '^$' | grep -v '//' | grep -v '/\*' | grep -v '\*/'| grep -v ' \*' | wc -l | awk '{print $1}'`
    h_line=`find . -name '*.h' | xargs grep -v '^$' | grep -v '//' | grep -v '/\*' | grep -v '\*/'| grep -v ' \*' | wc -l | awk '{print $1}'`

    lines=`expr $cc_line + $h_line`
    echo $lines
}

