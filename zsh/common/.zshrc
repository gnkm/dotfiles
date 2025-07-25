ZSH_DIR=$HOME/.zsh

export PATH=$HOME/.cask/bin:$PATH

# プロンプト
setopt prompt_subst

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' actionformats \
       '%F{yellow}[%b %c%u%f|%F{1}%a%f%F{yellow}]%f'
zstyle ':vcs_info:git:*' formats       \
       '%F{yellow}[%b %c%u]%f'
zstyle ':vcs_info:git:*' branchformat '%b'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr 'x'
precmd () { vcs_info }
local p_dir="%F{cyan}%3~ %f${vcs_info_msg_0_}"$'\n'
local p_host="%F{magenta}@%m %f%F{green}%#%f "
export PS1=${p_dir}${p_host}

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
if [ -s $ZSH_DIR/.dircolors ]; then
    if type dircolors > /dev/null 2>&1; then
        eval $(dircolors $ZSH_DIR/.dircolors)
    elif type gdircolors > /dev/null 2>&1; then
        eval $(gdircolors $ZSH_DIR/.dircolors)
    fi
fi

# zmv を使えるようにする
autoload -Uz zmv

# 各言語バージョン管理ツール設定

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# phpbrew
if [ -f $HOME/.phpbrew/bashrc ]; then
    source $HOME/.phpbrew/bashrc
fi

# commands installed with cabal
if [ -d $HOME/.cabal/bin ]; then
    PATH="$HOME/.cabal/bin:$PATH"
fi

# OPAM configuration
source $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# load fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.cache/lm-studio/bin"

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

# zplug 設定ファイルをロードする
COMMON_ZPLUG_FILENAME=common-zplug
COMMON_ZPLUG_FILE=$ZSH_DIR/$COMMON_ZPLUG_FILENAME

if [ -s $COMMON_ZPLUG_FILE ]; then
    source $COMMON_ZPLUG_FILE
fi

# npm の補完設定ファイルをロードする
NPM_COMPLETION_ZSHRC_FILENAME=npm-completions
NPM_COMPLETION_ZSHRC_FILE=$ZSH_DIR/$NPM_COMPLETION_ZSHRC_FILENAME
if which npm > /dev/null; then source $NPM_COMPLETION_ZSHRC_FILE; fi

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
