{ config, pkgs, ... }:

{
  home.stateVersion = "22.05";

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs; [
      ack
      asciinema
      asdf-vm
      astyle
      aws-vault
      autoconf
      bat
      ctags
      curl
      ddgr
      diff-so-fancy
      direnv
      elixir_ls
      exa
      fasd
      fd
      figlet
      fzf
      fzy
      gh
      gist
      glow
      gnupg
      htop
      httpie
      imagemagick
      jq
      lazygit
      libressl
      mkcert
      neofetch
      neovim
      ngrok
      nss
      ranger
      ripgrep
      shellcheck
      starship
      stripe-cli
      stow
      taskwarrior
      taskwarrior-tui
      terraform-ls
      thefuck
      tldr
      tmux
      tree
      tree-sitter
      watch
      watchman
    ];
}
