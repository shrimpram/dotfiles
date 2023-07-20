#!/usr/bin/env sh

sketchybar --add item space left

sketchybar --subscribe space space_change

sketchybar --set space           \
  align=center                   \
  label.color=$L2                \
  script="$DIR/plugins/space.sh" \
