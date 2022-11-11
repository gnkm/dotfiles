#! /usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title date
# @raycast.mode inline

# Optional parameters:
# @raycast.icon 📅

# Documentation:
# @raycast.description Show today
# @raycast.author gnkm

 date +"%Y/%m/%d(%a) %H:%M:%S week(%V)"
