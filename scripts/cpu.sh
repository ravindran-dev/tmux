#!/usr/bin/env bash
cpu=$(top -bn1 | awk '/Cpu\(s\)/ {printf "%d%%", 100-$8}')
echo "CPU $cpu"

