#!/usr/bin/env bash
set -u
set -o pipefail

clear

# Neon color palette (ANSI)
CYAN="\e[96m"
GREEN="\e[92m"
WHITE="\e[97m"
MAGENTA="\e[95m"
RESET="\e[0m"

# Get popup window size (works inside tmux display-popup)
HEIGHT=$(tput lines)
WIDTH=$(tput cols)

# Strip ANSI color codes to compute visible length
strip_ansi() {
  # Remove ESC[...m sequences
  echo -e "$1" | sed -r "s/\x1B\[[0-9;]*[mK]//g"
}

# Center text while respecting invisible ANSI sequences
center_text() {
  local text="$1"
  local visible
  visible=$(strip_ansi "$text")
  local len=${#visible}
  # Compute number of columns: print the colored string padded to center
  printf "%*s" $(( (WIDTH + len) / 2 )) "$(echo -e "$text")"
}

frames=(
"${CYAN}                INITIALIZING CYBER TERMINAL...${RESET}"
"${CYAN}                    INITIALIZING SYSTEM...${RESET}"
"${CYAN}                   BOOTING MATRIX MODULES...${RESET}"
"${CYAN}                      LOADING INTERFACE...${RESET}"
"${GREEN}                       SYSTEM READY ✔${RESET}"
)

mid=$(( HEIGHT / 2 - 6 ))

for frame in "${frames[@]}"; do
    clear
    # move cursor to approximate vertical center for animation
    printf "\e[%s;1H" "$mid"
    center_text "$frame"
    sleep 0.32
done

# Final ASCII neon logo (colors embedded)
ascii_art="${CYAN}
                                 ████████╗███╗   ███╗██╗   ██╗██╗  ██╗
                                 ╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝
                                    ██║   ██╔████╔██║██║   ██║ ╚███╔╝
                                    ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗
                                    ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗
                                    ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝
${RESET}"

# Center ASCII art block
art_lines=$(echo -e "$ascii_art" | sed -n '/./p' | wc -l)
start_line=$(( HEIGHT / 2 - art_lines / 2 ))

printf "\e[%s;1H" "$start_line"

while IFS= read -r line; do
    center_text "$line"
    echo
done <<< "$(echo -e "$ascii_art")"

# Bottom details
echo
center_text "${MAGENTA}                    Welcome to the Cyber TMUX Terminal${RESET}"
echo
center_text "${WHITE}                      $(date '+%a %b %d %I:%M:%S %p %Y')${RESET}"
echo
echo
center_text "${CYAN}                    < Press ENTER to continue >${RESET}"
read

