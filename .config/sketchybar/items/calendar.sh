#!/usr/bin/env sh

sketchybar --add item calendar right

sketchybar --set calendar                 \
	align=center                      \
	background.color=$RED             \
	icon.padding_left=10              \
	label.width=90                    \
	script="$DIR/plugins/calendar.sh" \
	update_freq=15                    \
