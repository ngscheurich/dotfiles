#!/bin/sh

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
NIX_PATH="nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixpkgs:/nix/var/nix/profiles/per-user/root/channels"
nix-shell '<home-manager>' -A install
home-manager switch -f "$HOME/.dotfiles/nixpkgs/.config/nixpkgs/home.nix"
