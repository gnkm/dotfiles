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
## Haskell
## when execute `stack install`, execution file is saved here
if [ -d $HOME/.local/bin ]; set -x PATH $HOME/.local/bin/ $PATH; end
### ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $HOME/.ghcup/bin $PATH
## linux brew
if [ -d $HOME/../linuxbrew/.linuxbrew/bin ]; set -x PATH $HOME/../linuxbrew/.linuxbrew/bin/ $PATH; end
# modular
if [ -d $HOME/.modular ]; set -x MODULAR_HOME $HOME/.modular; end
if [ -d $MODULAR_HOME/pkg/packages.modular.com_mojo/bin ]; set -x PATH $MODULAR_HOME/pkg/packages.modular.com_mojo/bin $PATH; end
# and run `fisher install FabioAntunes/fish-nvm edc/bass`.

# rustup shell setup
if not contains "$HOME/.cargo/bin" $PATH
    # Prepending path in case a system-installed rustc needs to be overridden
    set -x PATH "$HOME/.cargo/bin" $PATH
end

## poetry
set -x POETRY_CONFIG_DIR $HOME/.config/pypoetry
## wezterm
if [ -d /Applications/WezTerm.app/Contents/MacOS ]; set -x PATH /Applications/WezTerm.app/Contents/MacOS $PATH; end

# Loads some functions
## asdf
if [ -f /opt/homebrew/opt/asdf/libexec/asdf.fish ]; source /opt/homebrew/opt/asdf/libexec/asdf.fish; end
# bang-bang
if [ -f $HOME/.config/fish/functions/__history_previous_command.fish ]; source $HOME/.config/fish/functions/__history_previous_command.fish; end
if [ -f $HOME/.config/fish/functions/__history_previous_command_arguments.fish ]; source $HOME/.config/fish/functions/__history_previous_command_arguments.fish; end
if [ -f $HOME/.config/fish/conf.d/plugin-bang-bang.fish ]; source $HOME/.config/fish/conf.d/plugin-bang-bang.fish; end
## fisher
if [ -f $HOME/.config/fish/functions/fisher.fish ]; source $HOME/.config/fish/functions/fisher.fish; end
## Google Cloud SDK
if [ -f $HOME/google-cloud-sdk/path.fish.inc ]; source $HOME/google-cloud-sdk/path.fish.inc; end
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
## Use GNU grep on Mac
if which ggrep > /dev/null
    alias macgrep /usr/bin/grep
    alias grep ggrep
end

## Make python3 default.
alias python python3
alias pip pip3
alias sed gsed

# abbrebeations
abbr . 'source $HOME/.config/fish/config.fish'
# shorten Amazon URL
# e.g. echo 'https://www.amazon.co.jp/xxx/dp/12345' | ama
# => https://www.amazon.co.jp/dp/12345
abbr ama "awk -F/ '{print \$1\"//\"\$3\"/\"\$5\"/\"\$6}'"
abbr aria 'aria2c' # alt curl
abbr c 'code'
abbr d 'conda deactivate'
abbr hist 'history --show-time="%Y-%m-%d %H:%M:%S "'
abbr home '$HOME'
abbr md 'mkdir -p'
# show directories vertically
# e.g. pvd | tail -n 5
abbr pvd 'pwd | sed -e "s/\//\/\n/g"'
abbr rmr 'rm -rf'
abbr sa 'ssh-add (find $HOME/.ssh/ -name "id_*" -not -name "*.pub" | fzf)'

## date
abbr datefs 'date +"%Y/%m/%d(%a) %H:%M:%S"'
abbr datefymd 'date +"%Y-%m-%d"'  # e.g. glgs | rg (datefymd) | tail -r
abbr week 'date +"%V"'
## delta(diff)
abbr dltlr 'delta --side-by-side'
## docker
abbr di 'docker images'
abbr dps 'docker ps -a'
abbr drm 'docker rm'
abbr drmi 'docker rmi'
abbr drmii 'docker rmi (docker images | fzf | awk \'{print $3}\')' ### docker rmi interactively
abbr ds 'docker stop'
## docker compose
abbr dc 'docker compose'
abbr dcd 'docker compose down'
abbr dcps 'docker compose ps -a'
abbr dcup 'docker compose up'
## git
abbr ga 'git add'
abbr gan 'git add . -n'
abbr gbl 'git blame'
abbr gbr 'git branch'
abbr gcam 'git commit -am'
abbr gcm 'git commit'
abbr gcmm 'git commit -m'
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
## eza
abbr la 'eza -al --time-style long-iso'
abbr ll 'eza -l --time-style long-iso'
abbr lt 'eza -I ".git" -aTL 2'
## ls
abbr lla 'ls -la --time-style="+%Y-%m-%d %H:%M:%S"'
abbr lll 'ls -l --time-style="+%Y-%m-%d %H:%M:%S"'
## random
abbr dice 'random 1'

if not env | grep SSH_AGENT_PID --silent
    eval (ssh-agent -c)
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/miniconda3/etc/fish/conf.d/conda.fish"
        . "/opt/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
