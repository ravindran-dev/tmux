#!/usr/bin/env zsh
set -u
set -o pipefail

clear


CYAN="\e[96m"
GREEN="\e[92m"
WHITE="\e[97m"
MAGENTA="\e[95m"
RESET="\e[0m"
GREY="\e[90m"


HEIGHT=$(tput lines)
WIDTH=$(tput cols)


strip_ansi() {

  echo -e "$1" | sed -r "s/\x1B\[[0-9;]*[mK]//g"
}


center_text() {
  local text="$1"
  local visible
  visible=$(strip_ansi "$text")
  local len=${#visible}

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

    printf "\e[%s;1H" "$mid"
    center_text "$frame"
    sleep 0.32
done


ascii_art="${CYAN}
 ████████╗███╗   ███╗██╗   ██╗██╗  ██╗
 ╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝
    ██║   ██╔████╔██║██║   ██║ ╚███╔╝
    ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗
    ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗
    ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝
${RESET}"


art_lines=$(echo -e "$ascii_art" | sed -n '/./p' | wc -l)
start_line=$(( HEIGHT / 2 - art_lines / 2 ))

printf "\e[%s;1H" "$start_line"

while IFS= read -r line; do
    center_text "$line"
    echo
done <<< "$(echo -e "$ascii_art")"


echo
center_text "${MAGENTA}                    Welcome to the TMUX Terminal${RESET}"
echo
center_text "${WHITE}                    $(date '+%a %b %d %I:%M:%S %p %Y')${RESET}"
echo
echo
center_text "${GREY}                     Press ENTER to continue...${RESET}"
read

