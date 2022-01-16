{ config, lib, pkgs, ... }:

{
  homebrew.enable = true;

  homebrew = {
    brewPrefix = "/opt/homebrew/bin";
    cleanup = "zap";
    global.brewfile = true;
    global.noLock = true;
  };

  homebrew.taps = [
    "homebrew/cask"
    "homebrew/core"
    "homebrew/services"
  ];

  homebrew.brews = [
    "shpotify"
    "trash"    
  ];

  homebrew.casks = [
    "1password"
    "1password-cli"
    "ableton-live-lite"
    "affinity-designer"
    "affinity-photo"
    "affinity-publisher"
    "alfred"
    "amethyst"
    "android-sdk"
    "android-studio"
    "appcleaner"
    "aptible"
    "bartender"
    "blender"
    "cleanshot"
    "daisydisk"
    "dash"
    "discord"
    "dropbox"
    "epic-games"
    "fantastical"
    "figma"
    "firefox"
    "flipper"
    "godot"
    "google-chrome"
    "insomnia"
    "istat-menus"
    "itch"
    "karabiner-elements"
    "keycastr"
    "kitty"
    "love"
    "obsidian"
    "postico"
    "raycast"
    "react-native-debugger"
    "reaper"
    "slack"
    "spotify"
    "statusfy"
    "unity-hub"
    "wireshark"
    "zoom"
  ];

  homebrew.masApps = {
    Capo = 696977615;
    GarageBand = 682658836;
    Harvest = 506189836;
    Xcode = 497799835;
  };
}
