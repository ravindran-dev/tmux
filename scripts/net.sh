#!/usr/bin/env bash
set -u
set -o pipefail

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

[ -z "$iface" ] && echo "Net: Idle" && exit

rx1=$(cat /sys/class/net/$iface/statistics/rx_bytes)
tx1=$(cat /sys/class/net/$iface/statistics/tx_bytes)
sleep 1
rx2=$(cat /sys/class/net/$iface/statistics/rx_bytes)
tx2=$(cat /sys/class/net/$iface/statistics/tx_bytes)

rx_kb=$(( (rx2 - rx1) / 1024 ))
tx_kb=$(( (tx2 - tx1) / 1024 ))

printf "[%s] ⬇ %dKB/s ⬆ %dKB/s" "$iface" "$rx_kb" "$tx_kb"

