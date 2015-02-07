#! /usr/bin/env bash

# print the usage and exit
print_usage_and_exit () {
	cat <<____USAGE 1>&2
Usage   : ${0##*/} <OS>
____USAGE
	exit 1
}

case $1 in
    'centos' ) setup-scripts/os/centos.sh;;
    'mac' ) setup-scripts/os/mac.sh;;
    'ubuntu' ) setup-scripts/os/ubuntu.sh;;
    * ) print_usage_and_exit;;
esac
