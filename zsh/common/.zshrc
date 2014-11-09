export PATH=$HOME/.cask/bin:$PATH

# プロンプト
export PS1="%K{green}[%*] %k%K{magenta}%d %%%k "

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

# 各種ファイルをロードする
source ~/.dotfiles/zsh/common/.zshrc-aliases
source ~/.dotfiles/zsh/common/.zshrc-functions

# OS 特有の設定ファイルをロードする
source ~/.dotfiles/zsh/$(get-os)/.zshrc


