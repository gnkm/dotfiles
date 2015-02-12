# ===== antigen =====
source $HOME/vendor/apps/antigen/antigen.zsh

ZSH_DIR=$HOME/.zsh
COMMON_ANTIGEN_FILENAME=common-antigen
COMMON_ANTIGEN_FILE=$ZSH_DIR/$COMMON_ANTIGEN_FILENAME

if [ -s $COMMON_ANTIGEN_FILE ]; then
    source $COMMON_ANTIGEN_FILE
fi

# ===== original config =====

export PATH=$HOME/bin:$HOME/.cask/bin:$PATH

# プロンプト
export PS1='%F{magenta}[%*] %f%F{cyan}%d %f%F{green}%#%f '
# 補完機能を有効にする
autoload -Uz compinit
compinit

# http://gihyo.jp/dev/serial/01/zsh-book/0005
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z} r:|[-_.]=**' '+m:{A-Z}={a-z}'

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=123456
SAVEHIST=123456

# emacs風キーバインド
bindkey -e

bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

setopt hist_ignore_space
export EDITOR=vim
alias vi='$EDITOR'
bindkey -s '^z' '^[q %\\$EDITOR^m'

# その他とりあえずいるもの
export LANG=ja_JP.UTF-8

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ls のカラースキーム
if [ -s ~/.dircolors ]; then
    if type dircolors > /dev/null 2>&1; then
        eval $(dircolors ~/.dircolors)
    elif type gdircolors > /dev/null 2>&1; then
        eval $(gdircolors ~/.dircolors)
    fi
fi

# virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

# rbenv
if [ -f /usr/local/bin/rbenv ]; then
    eval "$(rbenv init -)"
fi

# 関数ファイルをロードする
COMMON_FUNCTIONS_FILENAME=common-functions
COMMON_FUNCTIONS_FILE=$ZSH_DIR/$COMMON_FUNCTIONS_FILENAME

if [ -s $COMMON_FUNCTIONS_FILE ]; then
    source $COMMON_FUNCTIONS_FILE
fi

# エイリアスファイルをロードする
COMMON_ALIASES_FILENAME=common-aliases
COMMON_ALIASES_FILE=$ZSH_DIR/$COMMON_ALIASES_FILENAME

if [ -s $COMMON_ALIASES_FILE ]; then
    source $COMMON_ALIASES_FILE
fi

# OS 特有の設定ファイルをロードする
OS_SPECIFIC_ZSHRC_FILENAME=os-specific-zshrc
OS_SPECIFIC_ZSHRC_FILE=$ZSH_DIR/$OS_SPECIFIC_ZSHRC_FILENAME
OS_SPECIFIC_ALIASES_FILENAME=os-specific-aliases
OS_SPECIFIC_ALIASES_FILE=$ZSH_DIR/$OS_SPECIFIC_ALIASES_FILENAME

if [ -s $OS_SPECIFIC_ZSHRC_FILE ]; then
    source $OS_SPECIFIC_ZSHRC_FILE
fi

if [ -s $OS_SPECIFIC_ALIASES_FILE ]; then
    source $OS_SPECIFIC_ALIASES_FILE
fi
