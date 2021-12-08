{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nick";
  home.homeDirectory = "/Users/nick";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # nixpkgs.config.allowUnfree = true;

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
    ngrok
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
