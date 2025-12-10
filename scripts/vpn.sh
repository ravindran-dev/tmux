

if command -v nmcli >/dev/null 2>&1; then
    if nmcli -t -f TYPE,STATE connection show --active 2>/dev/null \
        | grep -Eq '^(vpn|wireguard):activated'; then
        printf "#[bg=#1e1e2e,fg=#00ff87]#[bg=#00ff87,fg=#000000,bold] 🔐 VPN #[bg=#1e1e2e,fg=#00ff87]"
        exit 0
    fi
fi

if ip -o link show 2>/dev/null | grep -qE 'wg[0-9]*|tun[0-9]*'; then
    printf "#[bg=#1e1e2e,fg=#00ff87]#[bg=#00ff87,fg=#000000,bold] 🔐 VPN #[bg=#1e1e2e,fg=#00ff87]"
    exit 0
fi

printf " #[bg=#0e1e2e,fg=#00f6ff]#[fg=#000000,bg=#00f6ff,bold]🔓 VPN #[bg=#1e1e2e,fg=#00f6ff]"

