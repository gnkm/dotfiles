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

# pip
set -x PATH $HOME/Library/Python/2.7/bin $PATH

# rbenv
if test -d $HOME/.rbenv
  status --is-interactive; and source (rbenv init -|psub)
end

# fisher
source $HOME/.config/fish/functions/fisher.fish

# https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md
# disable to right prompt
function fish_right_prompt; end
set -g theme_color_scheme zenburn
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
