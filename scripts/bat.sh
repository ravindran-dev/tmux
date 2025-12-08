#!/usr/bin/env bash
if [ -r /sys/class/power_supply/BAT0/capacity ]; then
  cap=$(cat /sys/class/power_supply/BAT0/capacity)
  echo "BAT ${cap}%"
else
  echo "BAT AC"
fi

