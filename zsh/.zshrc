if command -v sheldon &> /dev/null; then
  eval "$(sheldon source)"
fi

if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

if type abbr &> /dev/null; then
  ## eza
  abbr la='eza -al --time-style long-iso'
  abbr ll='eza -l --time-style long-iso'
  abbr lt='eza -I ".git" -aTL 2'
  ## git
  abbr ga='git add'
  abbr gan='git add . -n'
  abbr gbl='git blame'
  abbr gbr='git branch'
  abbr gcam='git commit -am'
  abbr gcm='git commit'
  abbr gcmm='git commit -m'
  abbr gco='git checkout'
  abbr gd='git diff'
  abbr gf='git fetch'
fi
