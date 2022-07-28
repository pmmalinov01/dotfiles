#!/bin/bash

#set -euo pipefail
def_ses_name="simple"
check_session="$(tmux ls -F '#{session_name}' 2>/dev/null)"
echo "${check_session}"

if [[ "${check_session}" == "${def_ses_name}" ]]; then
  tmux attach-session -t "${def_ses_name}" \; select-window -t "default" \;
else

  tmux new-session -d -n "default" -s "${def_ses_name}"
  tmux new-window -n "alpha" -t "${def_ses_name}"
  tmux new-window -n "beta" -t "${def_ses_name}"
  tmux new-window -n "gamma" -t "${def_ses_name}"
  tmux attach-session -t "${def_ses_name}" \; select-window -t "default" \;
fi
