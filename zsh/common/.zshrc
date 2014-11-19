# ===== original config =====

# definitions of config files and directories

export PATH=$HOME/bin:$HOME/bin/vendor:$HOME/.cask/bin:$PATH

# プロンプト
TRIANGLE=$(echo -e "\ue0b0")
export PS1="%K{green}[%*]%k%K{magenta}%F{green}${TRIANGLE}%f%d %%%k%F{magenta}${TRIANGLE}%f "

# 補完機能を有効にする
autoload -Uz compinit
compinit

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

# エイリアスファイルをロードする
readonly ZSH_DIR=$HOME/.zsh
readonly COMMON_ALIASES_FILENAME=common-aliases
readonly COMMON_ALIASES_FILE=$ZSH_DIR/$COMMON_ALIASES_FILENAME

if [ -s $COMMON_ALIASES_FILE ] then;
    source $COMMON_ALIASES_FILE
fi

# OS 特有の設定ファイルをロードする
readonly OS_SPECIFIC_ZSHRC_FILENAME=os-specific-zshrc
readonly OS_SPECIFIC_ZSHRC_FILE=$ZSH_DIR/$OS_SPECIFIC_ZSHRC_FILENAME
readonly OS_SPECIFIC_ALIASES_FILENAME=os-specific-aliases
readonly OS_SPECIFIC_ALIASES_FILE=$ZSH_DIR/$OS_SPECIFIC_ALIASES_FILENAME

if [ -s $OS_SPECIFIC_ZSHRC_FILE ] then;
    source $OS_SPECIFIC_ZSHRC_FILE
fi

if [ -s $OS_SPECIFIC_ALIASES_FILE ] then;
    source $OS_SPECIFIC_ALIASES_FILE
fi

# load antigen-hs (https://github.com/Tarrasch/antigen-hs
source ~/.zsh/antigen-hs/init.zsh
