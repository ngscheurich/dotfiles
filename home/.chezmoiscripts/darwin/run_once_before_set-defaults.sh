#!/bin/sh

# Dock
defaults write com.apple.dock "tilesize" -int "48"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0.2"
defaults write com.apple.dock "autohide-delay" -float "0"
defaults write com.apple.dock "mineffect" -string "scale"

# Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# Desktop
defaults write com.apple.finder "CreateDesktop" -bool "false"

# Menu Bar
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE MMM d HH:mm\""

# Mouse
defaults write NSGlobalDomain com.apple.mouse.scaling -float "2.5"

# Keyboard
defaults write NSGlobalDomain AppleKeyboardUIMode -int "3"
defaults write NSGlobalDomain "InitialKeyRepeat" -float "15"
defaults write NSGlobalDomain "KeyRepeat" -float "2"

# Mission Control
defaults write com.apple.spaces "spans-displays" -bool "true"

killall Dock
killall Finder
killall SystemUIServer
