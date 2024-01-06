#!/usr/bin/env bash

if [ "$1" = "wofi" ]; then
  # check if wofi is running
  if pgrep wofi; then
    pkill wofi &
  else
    wofi -S drun -x 10 -y 10 -W 25% -H 60% &
  fi
fi
