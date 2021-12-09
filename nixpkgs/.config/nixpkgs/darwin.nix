{ config, pkgs, ... }:

{
  # List packages installed in system profile.
  environment.systemPackages = [];

  # Use a custom configuration.nix location.
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin.nix";

  # Auto upgrade nix package and the daemon service.
  nix.package = pkgs.nix;
  services.nix-daemon.enable = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # Used for backwards compatibility. Read the changelog before changing.
  system.stateVersion = 4;

  # Configure the dock.
  system.defaults.dock.autohide = true;
  system.defaults.dock.mineffect = "scale";
  system.defaults.dock.tilesize = 48;
}
