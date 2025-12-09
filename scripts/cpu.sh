#!/usr/bin/env zsh
cpu=$(top -bn1 | awk '/Cpu\(s\)/ {printf "%d%%", 100-$8}')
echo "CPU $cpu"

