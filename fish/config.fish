# PATH
## brew
if [ -d /opt/homebrew/bin ]; set -x PATH /opt/homebrew/bin $PATH; end
## cabal
if [ -d $HOME/.cabal/bin ]; set -x PATH $HOME/.cabal/bin $PATH; end
## cask
if [ -d $HOME/.cask/bin ]; set -x PATH $HOME/.cask/bin $PATH; end
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

# Appearance
## https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md
set -g theme_color_scheme zenburn
set -g theme_nerd_fonts yes
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
## disable to right prompt
function fish_right_prompt; end

# Python
# Make python3 default
alias python2 python
alias python python3

alias pip2 pip
alias pip pip3

# Unix Commands
switch (uname -s)
case 'Linux'
    abbr la 'ls -la --time-style="+%Y-%m-%d %H:%M:%S"'
    abbr ll 'ls -l --time-style="+%Y-%m-%d %H:%M:%S"'
case 'Darwin'
    if which gls > /dev/null
        abbr la 'gls -la --time-style="+%Y-%m-%d %H:%M:%S"'
    end
end

# datefymd を使ってその日のコミット一覧を表示する
# git lgs | ag (datefymd) | tail -r
abbr datefymd 'date +"%Y-%m-%d"'

abbr datefs 'date +"%Y/%m/%d %H:%M:%S"'
abbr hist 'history --show-time="%Y-%m-%d %H:%M:%S "'

# git
abbr gitlfsls 'git lfs ls-files'
