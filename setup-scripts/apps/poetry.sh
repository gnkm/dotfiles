#! /usr/bin/env bash

POETRY_CONFIG_DIR=$HOME/.config/pypoetry
if [ ! -d $POETRY_CONFIG_DIR ]; then
  mkdir -p $POETRY_CONFIG_DIR
fi
ln -s $HOME/.dotfiles/pypoetry/config.toml $POETRY_CONFIG_DIR/config.toml
