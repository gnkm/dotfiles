#! /usr/bin/env bash

OS=$1

ln -s $HOME/.dotfiles/zsh/common/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/common/.zshrc-aliases $HOME/.zsh/common-aliases
ln -s $HOME/.dotfiles/zsh/common/.zshrc-antigen $HOME/.zsh/common-antigen
ln -s $HOME/.dotfiles/zsh/common/.zshrc-functions $HOME/.zsh/common-functions

if [ $OS = 'mac' ]; then
    ln -s $HOME/.dotfiles/zsh/$OS/.zshrc-aliases-coreutils $HOME/.zsh/coreutils-aliases
fi

ln -s $HOME/.dotfiles/zsh/$OS/.zshrc-aliases $HOME/.zsh/os-specific-aliases
