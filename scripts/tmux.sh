#!/bin/zsh
set -u
set -o pipefail

session="tmux"

if tmux has-session -t "$session" 2>/dev/null; then
    tmux attach-session -t "$session"
else
    tmux new-session -s "$session"
fi

