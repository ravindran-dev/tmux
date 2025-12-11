#!/usr/bin/env zsh
set -u
set -o pipefail

clear

CYAN="\e[96m"
GREEN="\e[92m"
PURPLE="\e[95m"
YELLOW="\e[93m"
GREY="\e[90m"
RESET="\e[0m"

echo -e "
${PURPLE}CYBER TMUX – HELP MENU${RESET}

${CYAN}Prefix Key:${RESET} ${YELLOW}Ctrl + Space${RESET}

${GREEN}WINDOW / PANE${RESET}
  ${YELLOW}Prefix + c${RESET}     New window
  ${YELLOW}Prefix + -${RESET}     Split below
  ${YELLOW}Prefix + |${RESET}     Split right
  ${YELLOW}Alt + h/j/k/l${RESET}  Move between panes
  ${YELLOW}Prefix + z${RESET}     Zoom pane
  ${YELLOW}Prefix + x${RESET}     Kill pane
  ${YELLOW}Prefix + .${RESET}     Rename session
  ${YELLOW}Prefix + ,${RESET}     Rename window

${GREEN}SYSTEM${RESET}
  ${YELLOW}Prefix + r${RESET}     Reload config
  ${YELLOW}Prefix + ?${RESET}     Open this help menu

${GREEN}SPECIAL FEATURES${RESET}
  ${YELLOW}Prefix + a${RESET}     ASCII neon welcome popup
  ${YELLOW}Auto VPN detect${RESET}   Shows neon block only when connected
  ${YELLOW}Neon status bar${RESET}   CPU, RAM, Battery, NET, Time, Date

${GREY}Press ENTER to close...${RESET}
"

read

