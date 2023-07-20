#!/usr/bin/env sh

LABEL="$(yabai -m query --windows --window | jq -r '.app') | $(yabai -m query --windows --window | jq -r '.title')"

sketchybar --set $NAME label="$LABEL"
