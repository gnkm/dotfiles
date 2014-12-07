#! /usr/bin/env bash

# print the usage and exit
print_usage_and_exit () {
	cat <<____USAGE 1>&2
Usage   : ${0##*/} <left, right, current-window-status, window-status>
____USAGE
	exit 1
}

# TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
# TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
# TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
# TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=$(echo -e "\ue0b2")
TMUX_POWERLINE_SEPARATOR_LEFT_THIN=$(echo -e "\ue0b3")
TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=$(echo -e "\ue0b0")
TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=$(echo -e "\ue0b1")

left() {
    echo "#[fg=white, bg=blue] #S #[fg=blue, bg=default]$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD"
}

current-window-status() {
    echo "#[fg=green ,bg=yellow]$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD#[fg=black, bg=yellow] #I #W #F #[fg=yellow, bg=green]$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD"
}

window-status() {
    echo "#[fg=black, bg=default] #I #W #F #[fg=white]$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN"
}

"$@"
