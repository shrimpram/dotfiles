#!/usr/bin/env sh

sketchybar --add item volume right 

sketchybar --subscribe volume volume_change

sketchybar --set volume           \
  label.padding_right=7           \
  background.color=$GREEN         \
  icon.padding_left=7             \
  script="$DIR/plugins/volume.sh" \
