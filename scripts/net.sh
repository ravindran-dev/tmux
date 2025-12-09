#!/usr/bin/env bash

detect_active() {
    for iface in /sys/class/net/*; do
        name=$(basename "$iface")
        [ "$name" = "lo" ] && continue

        before=$(cat "$iface/statistics/rx_bytes")
        sleep 0.3
        after=$(cat "$iface/statistics/rx_bytes")

        if [ "$before" != "$after" ]; then
            echo "$name"
            return
        fi
    done
}

iface=$(detect_active)

[ -z "$iface" ] && echo "NET: Idle" && exit

rx1=$(cat /sys/class/net/$iface/statistics/rx_bytes)
tx1=$(cat /sys/class/net/$iface/statistics/tx_bytes)
sleep 1
rx2=$(cat /sys/class/net/$iface/statistics/rx_bytes)
tx2=$(cat /sys/class/net/$iface/statistics/tx_bytes)

rx_speed=$((rx2 - rx1))
tx_speed=$((tx2 - tx1))

printf "Net[%s] ⬇ %dB ⬆ %dB" "$iface" "$rx_speed" "$tx_speed"

