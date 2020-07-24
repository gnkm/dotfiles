# Management VSCode configs

## Save extensions

```
code --list-extensions > $HOME/.dotfiles/vscode/extensions.txt
```

## Install

```
cat $HOME/.dotfiles/vscode/extensions.txt | \
    xargs -I@ code --install-extension @
```
