#!/bin/sh

TPMDIR="$XDG_DATA_HOME/tpm/plugins/tpm"

if [ ! -d "$TPMDIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPMDIR"
fi
