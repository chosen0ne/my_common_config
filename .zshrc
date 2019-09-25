# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# bira, bureau, rkj-repos, gnzh
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
plugins=(osx git brew mvn npm python redis-cli ruby svn tmux golang cp iterm2 man spring z)

source $ZSH/oh-my-zsh.sh

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# User configuration

export GOROOT=/usr/local/go
export GOSRC=/usr/local/go/src/pkg

export GOPATH=/Users/louzhenlin/dev/workspace/go

# APP HOME
export JAVA_HOME=`/usr/libexec/java_home`
export MAVEN_HOME=/Users/louzhenlin/dev/downloads/apache-maven-3.2.3
export LUA_HOME=/Users/louzhenlin/dev/app/lua-5.2.3
export BTRACE_HOME=/Users/louzhenlin/dev/tools/btrace
export ZOOKEEPER_HOME=/Users/louzhenlin/dev/server/zookeeper-3.4.6
export NSQ_HOME=/Users/louzhenlin/dev/server/nsq-0.2.31.darwin-amd64.go1.3.1
export NODE_HOME=/Users/louzhenlin/dev/app/node-v0.10.32-darwin-x64
export REDIS_HOME=/Users/louzhenlin/dev/server/redis-2.8.17
#export PB_HOME=/Users/louzhenlin/dev/tools/protobuf

#export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
#export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:$NSQ_HOME/bin:$NODE_HOME/bin:$REDIS_HOME/bin:$ZOOKEEPER_HOME/bin
#export PATH=$LUA_HOME/bin:$MAVEN_HOME/bin:$PATH
#export PATH=$PATH:$BTRACE_HOME/bin

# auto modify PATH based on APP HOME
for app in `export | grep _HOME`
do
    app_path=`echo $app | cut -d = -f 2`
    # bin folder exists
    if [ -d $app_path'/bin' ]
    then
        export PATH=$PATH:$app_path'/bin'
    fi
done

export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad

# header include path for C and C++
# C_INCLUDE_PATH / CPLUS_INCLUDE_PATH
# specified by -I option

# static library path for C and C++
# LIBRARY_PATH: static library, can be specified by -L option
# LD_LIBRARY_PATH: dynamic library, user link

# include path for leveldb
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/Users/louzhenlin/dev/workspace/c_cpp/leveldb/include/
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/Users/louzhenlin/dev/workspace/c_cpp/leveldb/include/
export PKG_CONFIG_PATH=/usr/local/Cellar/pkg-config/0.28/bin/pkg-config

# include path for lua
export C_INCLUDE_PATH=./:$LUA_HOME/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=./:$LUA_HOME/include:$CPLUS_INCLUDE_PATH

export C_INCLUDE_PATH=$C_INCLUDE_PATH:/Users/louzhenlin/dev/workspace/c/infQ/src
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/Users/louzhenlin/dev/workspace/c/infQ/src

# static library path for infQ
export LIBRARY_PATH=/Users/louzhenlin/dev/workspace/c/infQ/src:/usr/local/lib
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/cuda/include

# add my apps (~/dev/app) to PATH, C_INCLUDE_PATH and LIBRARY_PATH
APP_HOME=/Users/louzhenlin/dev/app
for app in `ls ~/dev/app`
do
    # skip regular files
    if [ ! -d $APP_HOME/$app ]
    then
        continue
    fi

    # avoid repetition
    if [[ $PATH =~ $app ]]
    then
        continue
    fi

    export PATH=$PATH:$APP_HOME/$app/bin

    if [ -d "$APP_HOME/$app/include" ]
    then
        export C_INCLUDE_PATH=$C_INCLUDE_PATH:$APP_HOME/$app/include
        export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$APP_HOME/$app/include
    fi

    if [ -d "$APP_HOME/$app/lib/pkgconfig" ]
    then
        export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$APP_HOME/$app/lib/pkgconfig
    fi

    if [ -d "$APP_HOME/$app/lib" ]
    then
        export LIBRARY_PATH=$LIBRARY_PATH:$APP_HOME/$app/lib
    fi
done

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/cuda/lib

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

# commands
alias ll="ls -al"
alias grep="grep --color"
alias rm="safe_rm"
alias rawrm="/bin/rm"

alias g108="ssh root@202.205.91.108"
alias g107="ssh root@202.205.91.107"
alias g222="ssh root@202.205.93.222"

function g() {
    ssh root@202.205.91.$1
}

# edit and source private config
alias erc="vim ~/.zshrc"
alias src="source ~/.zshrc"

# alias for man
alias manlocal="man -M $LOCAL_MANPATH"
alias addman="cp -a man/* $LOCAL_MANPATH"

# use macvim
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

# handy tools
alias cwd="pwd | pbcopy"

# start a local server at current directory
alias lserver="python -m SimpleHTTPServer"

alias cgotags="gotags -R=true -f=tags ."
alias cctags="ctags -R *"

alias lftree="ftree -l -r"
alias sys_headers='cd /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include'

source /Users/louzhenlin/dev/tools/z/z.sh

# functions
# compile leveldb app
function mklvdb() {
    g++ -g -ggdb -o $2 $1 /usr/local/lib/libsnappy.a /Users/louzhenlin/dev/workspace/c_cpp/leveldb/libleveldb.a -I/Users/louzhenlin/dev/workspace/c_cpp/leveldb/include -lpthread
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

COMMENT_SPACE_PATTERN="(/\*)|(\*/)|(^\s*\*)|(\/\/)|(^\s*$)"

# calc code lines for C
function clines() {
    lines=`find -E . -regex "(.*\.c$)|(.*.h$)" |xargs grep -E -v "$COMMENT_SPACE_PATTERN" | wc -l | awk '{print $1}'`
    echo $lines
}

# calc code lines for C
function cpplines() {
    lines=`find -E . -regex "(.*\.cc$)|(.*\.cpp$)|(.*\.hpp$)|(.*\.h$)" | xargs grep -E -v "$COMMENT_SPACE_PATTERN" | wc -l | awk '{print $1}'`
    echo $lines
}

function golines() {
    lines=`find . -name '*.go' | xargs grep -E -v "$COMMENT_SPACE_PATTERN" | wc -l | awk '{print $1}'`
    echo $lines
}

function javalines() {
    lines=`find . -name '*.java' | xargs grep -E -v "$COMMENT_SPACE_PATTERN" | wc -l | awk '{print $1}'`
    echo $lines
}

function pylines() {
    lines=`find . -name '*.py' | xargs grep -E -v "(^\s*$)|(#)|(''')" | wc -l | awk '{print $1}'`
    echo $lines
}

# kill process by name
function kpn() {
    ps axu | grep $1 | grep -v grep | awk '{print $2}' | xargs kill
}

# grep process by name
function pn() {
    ps axu | grep $1 | grep -v grep
}

# safe rm
# Don't remove the file, just move them to a temporary directory.
# Files are grouped by remove time.
# e.g.
#   # pwd => /home/work/
#   > rm -r -f aa
#   'aa' will move to ~/.TrashHistory/20141018/aa@120111@^home^work^aa
_RM_BACKUP_PATH=/Users/louzhenlin/.TrashHistory
function safe_rm() {
    # skip cmd option, e.g. '-rf' in 'rm -rf a b' or '-r/-f' in 'rm -r -f a b'
    local first_char=${1:0:1}
    until [ ! "$first_char" = "-" ]
    do
        shift
        first_char=${1:0:1}
    done

    # check param
    if [ $# -lt 1 ]; then
        echo 'usage: rm [-f | -i] [-dPRrvW] file ...'
        exit 1
    fi

    local today=`date +"%Y%m%d"`
    local mvpath=${_RM_BACKUP_PATH}/$today

    # support for multi version
    local timestamp=`date +"%H%M%S"`

    # create dir if path non-exist
    if [ ! -d $mvpath ]; then
        mkdir $mvpath
    fi

    until [ $# -eq 0 ]
    do
        # fetch absolute path of the file
        local file_path=$1
        local fchar=`echo "${file_path:0:1}"`
        if [ "$fchar" = "/" ]; then
            local abs_fpath="${file_path}"
        else
            local abs_fpath=`pwd`/$file_path
        fi
        local file_name=`basename $file_path`
        local dist_path="${file_name}@${timestamp}@${abs_fpath}"

        # substitue '/' to '^'
        local final_dist_path=${dist_path//\//^}

        # mv to temp trash
        mv $file_path $mvpath/$final_dist_path

        # next file
        shift
    done
}

# revert files that remove by safe_rm
# you can choose the right one in multi files removed
# e.g.:
#   revert_rm service
function revert_rm() {
    # process multi files
    until [ $# -eq 0 ]
    do
        echo "revert for $1:"
        for _f in `find $_RM_BACKUP_PATH -name "*$1*@*" -print`
        do
            local d=`echo $_f | cut -d / -f 5`
            local t=`echo $_f | cut -d @ -f 2`
            local file_path=`echo $_f | awk -F@ '{print $3}'`
            file_path=${file_path//\^/\/}

            echo -n "      $file_path removed at ${d:0:4}-${d:4:2}-${d:6:2} ${t:0:2}:${t:2:2}:${t:4:2}   [y/n]? "
            read _confirm
            if [ "${_confirm}" = 'y' ]; then
                mv $_f $file_path
                break
            fi
        done

        shift
    done
}

# force remove files in .TrashHistory
# USAGE: clear_trash gologging_file*
function clear_trash() {
    if [ $# -lt 1 ]; then
        echo "USAGE: clear_trash NAME_PATTERN"
    fi

    find $_RM_BACKUP_PATH -name "$1*" -print -exec /bin/rm {} \;
}

# first search built in man path
# if non-exist, search local man path
function manr() {
    man $1
    if [ $? -ne 0 ]; then
        manlocal $1
    fi
}


function momogit() {
    git config --local user.name "娄振林"
    git config --local user.email "lou.zhenlin@immomo.com"
}

# mkdir and cd
function mkcdir() {
    mkdir -p $1
    cd $1
}

# fuzzy find
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
