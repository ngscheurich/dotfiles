{ pkgs, lib, ... }:

{
  system.stateVersion = 4;

  system.defaults.dock = {
    autohide = true;
    mineffect = "scale";
    tilesize = 48;
  };

  system.defaults.NSGlobalDomain = {
    "com.apple.trackpad.scaling" = "1.0";
    InitialKeyRepeat = 15;
    KeyRepeat = 2;
  };
}
