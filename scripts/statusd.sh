#!/usr/bin/env bash

cache="$HOME/.config/tmux/scripts/cache"
mkdir -p "$cache"

while true; do
    ~/.config/tmux/scripts/cpu.sh  > "$cache/cpu"
    ~/.config/tmux/scripts/mem.sh  > "$cache/mem"
    ~/.config/tmux/scripts/net.sh  > "$cache/net"
    ~/.config/tmux/scripts/bat.sh  > "$cache/bat"
    ~/.config/tmux/scripts/vpn.sh  > "$cache/vpn"
    sleep 2
done

