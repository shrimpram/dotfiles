#!/usr/bin/env sh

LABEL="$(yabai -m query --spaces --space | jq -r '.index')"

sketchybar --set $NAME label="[$LABEL]"
