#!/bin/sh

# Cycle wallpapers from folder each run

DIR=$HOME/.config/wallpapers
PICS=($(ls ${DIR}))

RANDOM_PICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

CURSOR_POS=$(hyprctl cursorpos | sed -e 's/ //g')

swww img --transition-type grow --transition-pos ${CURSOR_POS} ${DIR}/${RANDOM_PICS}
