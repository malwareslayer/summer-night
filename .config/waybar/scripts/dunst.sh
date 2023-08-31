#!/usr/bin/env sh

COUNT="$(dunstctl count history)"

if dunstctl is-paused | grep -q "false"; then
  if [ "$COUNT" != "0" ]; then
    echo "🔔 $COUNT";
  else
    echo "🔔 ";
  fi
else
  echo "🔕 ";
fi