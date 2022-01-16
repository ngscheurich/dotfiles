{ pkgs, lib, ... }:

{
  imports = [
    ./system.nix
    ./homebrew.nix
  ];

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;
  programs.fish.enable = true;

  environment.shells = with pkgs; [
    fish
  ];
}
