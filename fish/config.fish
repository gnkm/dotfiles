eval (ssh-agent -c)

# PATH
## brew
if [ -d /opt/homebrew/bin ]; set -x PATH /opt/homebrew/bin $PATH; end
## cabal
if [ -d $HOME/.cabal/bin ]; set -x PATH $HOME/.cabal/bin $PATH; end
## cask
if [ -d $HOME/.cask/bin ]; set -x PATH $HOME/.cask/bin $PATH; end
## coreutils
if [ -d /opt/homebrew/opt/coreutils/libexec/gnubin ]; set -x PATH /opt/homebrew/opt/coreutils/libexec/gnubin $PATH; end
## GOPATH
set -x GOPATH $HOME/projects
if [ -d $GOPATH ]; set -x PATH $GOPATH/bin $PATH; end
## linux brew
if [ -d $HOME/../linuxbrew/.linuxbrew/bin ]; set -x PATH $HOME/../linuxbrew/.linuxbrew/bin/ $PATH; end
## poetry
if [ -d $HOME/Library/Python/3.9/bin ]; set -x PATH $HOME/Library/Python/3.9/bin $PATH; end

# Loads some functions
## anyenv
if which anyenv > /dev/null; status --is-interactive; and source (anyenv init -|psub); end
## fisher
if [ -f $HOME/.config/fish/functions/fisher.fish ]; source $HOME/.config/fish/functions/fisher.fish; end
## Google Cloud SDK
if [ -f $HOME/google-cloud-sdk/path.fish.inc ]; source $HOME/google-cloud-sdk/path.fish.inc; end
## pyenv
if which pyenv > /dev/null; status --is-interactive; and source (pyenv init -|psub); end
## zoxide
if which zoxide > /dev/null; status --is-interactive; and zoxide init --cmd j fish | source; end

# Appearance
## https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md
set -g theme_color_scheme zenburn
set -g theme_nerd_fonts yes
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
## disable to right prompt
function fish_right_prompt; end

# aliases
alias awk gawk
## Make python3 default.
alias python python3
alias pip pip3
alias sed gsed

# abbrebeations
abbr . 'source $HOME/.config/fish/config.fish'
abbr ab 'cat $HOME/.config/fish/config.fish | rg "abbr" | less'
abbr c 'code .'
abbr datefs 'date +"%Y/%m/%d(%a) %H:%M:%S"'
abbr datefymd 'date +"%Y-%m-%d"'  # e.g. glgs | ag (datefymd) | tail -r
## docker
abbr d 'docker'
abbr dps 'docker ps -a'
abbr drm 'docker rm'
abbr ds 'docker stop'
## docker compose
abbr dc 'docker compose'
abbr dcd 'docker compose down'
abbr dcps 'docker compose ps -a'
abbr dcup 'docker compose up'
## exa
abbr exal 'exa -al --time-style long-iso'
abbr exl 'exa -l --time-style long-iso'
abbr ext 'exa -I ".git" -aTL 2'
## git
abbr ga 'git add'
abbr gbl 'git blame'
abbr gbr 'git branch'
abbr gcam 'git commit -am'
abbr gco 'git checkout'
abbr gd 'git diff'
abbr gf 'git fetch'
### graph
abbr ggraph 'git log \
  --graph \
  --pretty=format:"%C(yellow)%h%Creset %C(magenta)[%s]%d%Creset %C(cyan)%ad%Creset %C(red)%an%Creset" \
  --date=iso'
### detailed log
abbr glgd 'git log \
  --pretty=format:"%C(yellow)%h%Creset %C(magenta)[%s]%d%Creset %C(cyan)%ad%Creset %C(red)%an%Creset" \
  --date=iso \
  --date-order \
  -C \
  -M \
  -p'
### simple log
abbr glgs 'git log \
  --pretty=format:"%C(yellow)%h%Creset %C(magenta)[%s]%d%Creset %C(cyan)%ad%Creset %C(red)%an%Creset" \
  --date=iso \
  --date-order \
  -C \
  -M \
  --name-status'
abbr gls 'git ls-files'
abbr gp 'git push'
abbr gr 'git restore'
abbr grst 'git restore --staged'
abbr gs 'git status'

abbr gitlfsls 'git lfs ls-files'
abbr hist 'history --show-time="%Y-%m-%d %H:%M:%S "'
abbr la 'ls -la --time-style="+%Y-%m-%d %H:%M:%S"'
abbr ll 'ls -l --time-style="+%Y-%m-%d %H:%M:%S"'
abbr md 'mkdir -p'
abbr sa 'ssh-add (find $HOME/.ssh | fzf)'
