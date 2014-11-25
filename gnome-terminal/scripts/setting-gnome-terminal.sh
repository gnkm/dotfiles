#! /usr/bin/env bash

# e.g.
# ./setting-gnome-terminal.sh g cursor_blink_mode
# ./setting-gnome-terminal.sh s cursor_blink_mode string 'off'

# print the usage and exit
print_usage_and_exit () {
	cat <<____USAGE 1>&2
Usage   : ${0##*/} <var1> <var2> ...
____USAGE
	exit 1
}

case $1 in
    g):
	gconftool-2 --get /apps/gnome-terminal/profiles/Profile0/$2;;
    s):
	echo "gconftool-2 --set /apps/gnome-terminal/profiles/Profile0/$2 --type $3 $4"
	gconftool-2 --set /apps/gnome-terminal/profiles/Profile0/$2 --type $3 "$4";;
    *):
	print_usage_and_exit;;
esac
