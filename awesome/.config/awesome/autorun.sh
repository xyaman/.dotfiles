#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# always setup keyboard
setxkbmap es

run nm-applet
run pamac-tray
run xfce4-power-manager
run volumeicon
run nitrogen --restore
run picom -b
run dunst
