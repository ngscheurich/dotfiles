#!/bin/sh

if [ ! -d /nix ]; then
  if [ `uname` = "Darwin" ]; then
    sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon
  else
    sh <(curl -L https://nixos.org/nix/install) --daemon
  fi
  
  exec "$SHELL"
fi
