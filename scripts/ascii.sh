#!/usr/bin/env bash
clear

# Get popup window dimensions
HEIGHT=$(tput lines)
WIDTH=$(tput cols)

center_text() {
    local text="$1"
    local text_len=${#text}
    printf "%*s" $(( (WIDTH + text_len) / 2 )) "$text"
}

frames=(
"     INITIALIZING CYBER TERMINAL  "
"       INITIALIZING SYSTEM...     "
"      BOOTING MATRIX MODULES...   "
"         LOADING INTERFACE...     "
"            SYSTEM READY ✔        "
)

# Vertical center for animation
mid=$(( HEIGHT / 2 - 6 ))

for frame in "${frames[@]}"; do
    clear
    printf "\e[%s;1H" "$mid"
    center_text "$frame"
    sleep 0.30
done

# Final ASCII (no extra indentation)
ascii_art="
                                ████████╗███╗   ███╗██╗   ██╗██╗  ██╗
                                ╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝
                                   ██║   ██╔████╔██║██║   ██║ ╚███╔╝
                                   ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗
                                   ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗
                                   ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝
"

# Center ASCII art
art_lines=$(echo "$ascii_art" | wc -l)
start_line=$(( HEIGHT / 2 - art_lines / 2 ))

printf "\e[%s;1H" "$start_line"

while IFS= read -r line; do
    center_text "$line"
    echo
done <<< "$ascii_art"


# Bottom messages (consistent spacing)
echo
center_text "Welcome to the tmux Terminal "
echo
center_text "$(date '+%a %b %d %I:%M:%S %p %Y')"
echo
echo
center_text "< Press ENTER to continue >"
read

