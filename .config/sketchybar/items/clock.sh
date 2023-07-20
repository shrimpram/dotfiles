#!/usr/bin/env sh

sketchybar --add item clock right

sketchybar --set clock           \
  align=center                   \
  background.color=$MAGENTA      \
  icon.padding_left=10           \
  label.padding_right=10         \
  script="$DIR/plugins/clock.sh" \
  update_freq=1                  \
