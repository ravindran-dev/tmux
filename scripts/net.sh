#!/usr/bin/env bash

cache_dir="$HOME/.config/tmux/scripts/cache"
mkdir -p "$cache_dir"
cache="$cache_dir/net"

iface=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $5; exit}')
[ -z "$iface" ] && exit

rx=$(cat /sys/class/net/$iface/statistics/rx_bytes 2>/dev/null || echo 0)
tx=$(cat /sys/class/net/$iface/statistics/tx_bytes 2>/dev/null || echo 0)
now=$(date +%s)

if [ -f "$cache" ]; then
    read prev_rx prev_tx prev_time < "$cache"
    dt=$((now - prev_time))
    [ "$dt" -gt 0 ] || dt=1
    rx_kb=$(( (rx - prev_rx) / 1024 / dt ))
    tx_kb=$(( (tx - prev_tx) / 1024 / dt ))
else
    rx_kb=0
    tx_kb=0
fi

echo "$rx $tx $now" > "$cache"

printf "%s ⬇ %dKB/s ⬆ %dKB/s" "$iface" "$rx_kb" "$tx_kb"

