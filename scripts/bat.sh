
#!/usr/bin/env bash
set -u
set -o pipefail

BAT=""
for p in /sys/class/power_supply/BAT*; do [ -e "$p" ] && BAT="$p" && break; done

status=""
capacity="0"
if [ -n "$BAT" ]; then
  status=$(cat "$BAT/status" 2>/dev/null || true)
  capacity=$(cat "$BAT/capacity" 2>/dev/null || echo "0")
fi

ac=0
for p in /sys/class/power_supply/*; do
  name=$(basename "$p")
  case "$name" in
    BAT* ) continue ;;
  esac
  if [ -f "$p/online" ]; then
    v=$(cat "$p/online" 2>/dev/null || echo "0")
    [ "$v" = "1" ] && ac=1 && break
  fi
  if [ -f "$p/present" ]; then
    v=$(cat "$p/present" 2>/dev/null || echo "0")
    if [ "$v" = "1" ]; then
      t=$(cat "$p/type" 2>/dev/null || echo "")
      case "$(printf "%s" "$t" | tr '[:upper:]' '[:lower:]')" in
        *ac*|*mains*|*adapter*|*usb*) ac=1 && break ;;
      esac
    fi
  fi
done

if command -v upower >/dev/null 2>&1; then
  dev=$(upower -e 2>/dev/null | grep -i battery | head -n1 || true)
  if [ -n "$dev" ]; then
    up_state=$(upower -i "$dev" 2>/dev/null | awk -F: '/state/ {gsub(/^[ \t]+/,"",$2); print $2; exit}' | tr '[:upper:]' '[:lower:]' || true)
    up_perc=$(upower -i "$dev" 2>/dev/null | awk -F: '/percentage/ {gsub(/[^0-9]/,"",$2); print $2; exit}' || true)
    [ -n "$up_perc" ] && capacity="$up_perc"
    case "$up_state" in charging|fully-charged|pending-charge) ac=1 ;; esac
  fi
fi

status_lc=$(printf "%s" "$status" | tr '[:upper:]' '[:lower:]' || true)
case "$status_lc" in charging|full|fully-charged|pending-charge) ac=1 ;; esac

if [ "${ac:-0}" -eq 1 ]; then
  printf "#[bg=#1e1e2e,fg=#00ff87]#[bg=#00ff87,fg=#000000,bold]  %s%% #[bg=#1e1e2e,fg=#00ff87]" "$capacity"
else
  printf "#[bg=#1e1e2e,fg=#00f6ff]#[fg=#000000,bg=#00f6ff,bold]  %s%% #[bg=#1e1e2e,fg=#00f6ff]" "$capacity"
fi

exit 0
