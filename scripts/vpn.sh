#!/usr/bin/env zsh
set -u
set -o pipefail

connected=0
if command -v nmcli >/dev/null 2>&1; then
  if nmcli -t -f TYPE,STATE connection show --active 2>/dev/null | grep -Eq '^(vpn|wireguard):activated'; then
    connected=1
  fi
fi
if [ "$connected" -eq 0 ] && ip -o link show 2>/dev/null | grep -qE 'wg[0-9]*|tun[0-9]*'; then
  connected=1
fi
if [ "$connected" -eq 1 ]; then
  printf "#[bg=#1e1e2e,fg=#00ff87]#[bg=#00ff87,fg=#000000,bold] 󰦝 VPN #[bg=#1e1e2e,fg=#00ff87]"
fi
exit 0

