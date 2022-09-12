#!/bin/bash

set -euo pipefail

session_name="K8S"
declare -a kubernetes_clusters=("k8s-qa" "k8s-qac")


tmux new-session -d -n "default" -s "${session_name}"
for cluster in ${kubernetes_clusters[@]}; do
  tmux new-window -n "${cluster}" -t "${session_name}"
  tmux send-keys -t "${session_name}" "ssh ${cluster}" Enter
done


tmux attach-session -t "${session_name}" \; select-window -t "default" \;
