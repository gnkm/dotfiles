#! /usr/bin/env bash

cat ../vscode/extensions.txt | \
    xargs -I@ code --install-extension @
