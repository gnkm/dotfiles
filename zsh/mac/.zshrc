# phpbrew
if [ -f $HOME/.phpbrew/bashrc ]; then
    phpbrew lookup-prefix homebrew
fi
# mactex
export PATH=/usr/local/texlive/2015/bin/x86_64-darwin:$PATH
# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
