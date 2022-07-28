#!/usr/bin/env bash

lang=`echo "bash golang python3" | tr ' ' '\n'`
core_utils=`echo "ansible find grep awk sed" | tr ' ' '\n'`

selected=`echo -e "$lang\n$core_utils"| fzf`
echo "selected $selected"

read -p "query:" query
echo "$selected $query"

if [[ $selected =~ lang ]]; then
      tmux neww	bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
      tmux neww bash -c	"curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
