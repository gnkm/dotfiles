# ===== Source Prezto. =====
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ===== original config =====

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

# 各種ファイルをロードする
source ~/.dotfiles/zsh/common/.zshrc-aliases
source ~/.dotfiles/zsh/common/.zshrc-functions

# OS 特有の設定ファイルをロードする
source ~/.dotfiles/zsh/$(get-os)/.zshrc
