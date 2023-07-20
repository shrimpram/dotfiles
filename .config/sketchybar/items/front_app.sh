#!/usr/bin/env sh

sketchybar --add item front_app left

sketchybar --add event window_focus \
  --add event title_change

sketchybar --subscribe front_app \
  window_focus                   \
  front_app_switched             \
  space_change                   \
  title_change                   \

sketchybar --set front_app           \
  align=center                       \
  label.color=$L2                    \
  script="$DIR/plugins/front_app.sh" \
