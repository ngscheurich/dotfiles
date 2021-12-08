{ config, pkgs, ... }:

{
  home.username = "nick";
  home.homeDirectory = "/Users/nick";
  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    asciinema
    asdf-vm
    astyle
    awscli
    aws-vault
    autoconf
    bat
    cocoapods
    ctags
    curl
    diff-so-fancy
    direnv
    elixir_ls
    exa
    fd
    figlet
    fish
    fzf
    fzy
    gh
    gist
    git
    glow
    gnupg
    htop
    httpie
    jq
    lazygit
    neofetch
    neovim
    ngrok-1
    ranger
    ripgrep
    shellcheck
    stripe-cli
    stow
    taskwarrior
    taskwarrior-tui
    terraform-ls
    thefuck
    tldr
    tmux
    tree
  ];
}
