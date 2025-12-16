#!/usr/bin/env bash
cache=~/.config/tmux/scripts/cache/cpu

if [ -f "$cache" ] && [ $(( $(date +%s) - $(stat -c %Y "$cache") )) -lt 2 ]; then
  cat "$cache"
  exit
fi

read cpu a b c idle rest < /proc/stat
total=$((a+b+c+idle))
prev=$(cat "$cache.prev" 2>/dev/null || echo "$total $idle")
ptotal=${prev% *}
pidle=${prev#* }

dt=$((total - ptotal))
di=$((idle - pidle))
usage=$(( (100 * (dt - di)) / dt ))

echo "$total $idle" > "$cache.prev"
echo "$usage%" | tee "$cache"

