#!/usr/bin/env zsh

set -u
set -o pipefail

mem=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
echo "RAM $mem"

