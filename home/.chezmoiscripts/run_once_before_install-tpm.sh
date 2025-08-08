#!/bin/sh

TPMDIR="$TMUX_PLUGIN_MANAGER_PATH/tpm"

if [ ! -d "$TPMDIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPMDIR"
fi
