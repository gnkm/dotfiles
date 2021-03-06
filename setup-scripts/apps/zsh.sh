#! /usr/bin/env bash

OS=$1
ZSH_DIR=$HOME/.zsh

mkdir $ZSH_DIR
# z の履歴ファイル作成
touch $ZSH_DIR/.z

ln -s $HOME/.dotfiles/zsh/common/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/common/.zshrc-aliases $ZSH_DIR/common-aliases
ln -s $HOME/.dotfiles/zsh/common/.zshrc-zplug $ZSH_DIR/common-zplug
ln -s $HOME/.dotfiles/zsh/common/.zshrc-functions $ZSH_DIR/common-functions
ln -s $HOME/.dotfiles/zsh/common/.dircolors.zenburn $ZSH_DIR/.dircolors

if [[ -s $HOME/.dotfiles/zsh/$OS/.zshrc ]]; then
    ln -s $HOME/.dotfiles/zsh/$OS/.zshrc $ZSH_DIR/os-specific-zshrc
fi

if [[ $OS = 'mac' ]]; then
    ln -s $HOME/.dotfiles/zsh/$OS/.zshrc-aliases-coreutils $ZSH_DIR/coreutils-aliases
fi

ln -s $HOME/.dotfiles/zsh/$OS/.zshrc-aliases $ZSH_DIR/os-specific-aliases
