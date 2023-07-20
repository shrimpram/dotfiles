#!/usr/bin/env sh

NETWORK="$(/Sy*/L*/Priv*/Apple8*/V*/C*/R*/airport -I | grep -w SSID | sed 's/ *SSID: //')"

if [ -z "$NETWORK" ]
then
  ICON="󰖪"
  LABEL=""
  sketchybar --set $NAME label.padding_right=2
else
  ICON="󰖩"
  LABEL="$NETWORK"
  sketchybar --set $NAME label.padding_right=10
fi

sketchybar --set $NAME icon="$ICON" label="$LABEL"
