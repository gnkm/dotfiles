#! /usr/bin/env bash

# e.g.
# ./setting-gnome-terminal.sh g cursor_blink_mode
# ./setting-gnome-terminal.sh s cursor_blink_mode string 'off'

# set zenburn theme
## ./setting-gnome-terminal.sh s palette '#3F3F3F3F3F3F:#CCCC93939393:#7F7F9F9F7F7F:#E3E3CECEABAB:#DFDFAFAF8F8F:#CCCC93939393:#8C8CD0D0D3D3:#DCDCDCDCCCCC:#3F3F3F3F3F3F:#CCCC93939393:#7F7F9F9F7F7F:#E3E3CECEABAB:#DFDFAFAF8F8F:#CCCC93939393:#8C8CD0D0D3D3:#DCDCDCDCCCCC'
## ./setting-gnome-terminal.sh s background_color '#3F3F3F3F3F3F'
## ./setting-gnome-terminal.sh s foreground_color '#DCDCDCDCCCCC'
## ./setting-gnome-terminal.sh s bold_color '#E3E3CECEABAB'

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
