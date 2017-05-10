# PATH
# cask
if test -d $HOME/.cask/bin
  set -x PATH $HOME/.cask/bin $PATH
end

# cabal
if test -d $HOME/.cabal/bin
  set -x PATH $HOME/.cabal/bin $PATH
end

# obtained by go get
set -x GOPATH $HOME/.go
if test -d $GOPATH
  set -x PATH $GOPATH/bin $PATH
end

# *env
# nodebrew
if test -d $HOME/.nodebrew/current/bin
  set -x PATH $HOME/.nodebrew/current/bin $PATH
end

# pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH PYENV_ROOT/bin $PATH
status --is-interactive; and source (pyenv init -|psub)

# pyenv-virtualenv
status --is-interactive; and source (pyenv virtualenv-init -|psub)

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md
set -gx theme_powerline_fonts no
