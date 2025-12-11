#!/usr/bin/env zsh
set -u
set -o pipefail

cpu=$(top -bn1 | awk '/Cpu\(s\)/ {printf "%d%%", 100-$8}')
echo "CPU $cpu"

