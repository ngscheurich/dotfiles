#!/bin/sh

hostname=$(
  gum input \
    --header "Computer hostname" \
    --placeholder "Enter the desired hostname"
)

sudo scutil --set HostName "$hostname"
sudo scutil --set LocalHostName "$hostname"
sudo scutil --set ComputerName "$hostname"

dscacheutil -flushcache
