{ config, pkgs, ... }:

{
  home.stateVersion = "22.05";

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs; [
      asciinema
      asdf-vm
      astyle
      aws-vault
      autoconf
      bat
      ctags
      curl
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
      jq
      lazygit
      libressl
      neofetch
      neovim
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
