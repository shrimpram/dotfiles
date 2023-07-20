#!/usr/bin/env sh

sketchybar --add item network right

sketchybar --set network                 \
	update_freq=15                   \
	icon.padding_left=10             \
	align=center                     \
	script="$DIR/plugins/network.sh" \
	background.color=$YELLOW         \
