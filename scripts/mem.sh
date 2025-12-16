#!/usr/bin/env bash
cache=~/.config/tmux/scripts/cache/mem

if [ -f "$cache" ] && [ $(( $(date +%s) - $(stat -c %Y "$cache") )) -lt 3 ]; then
  cat "$cache"
  exit
fi

mem=$(free -m | awk '/Mem:/ {printf "%d%%", $3*100/$2}')
echo "$mem" | tee "$cache"

