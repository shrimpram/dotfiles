#!/usr/bin/env sh

sketchybar --add item battery right

sketchybar --set battery                 \
	align=center                     \
	background.color=$CYAN           \
	icon.padding_left=5              \
	label.padding_right=5            \
	script="$DIR/plugins/battery.sh" \
	update_freq=1                    \
