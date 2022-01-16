# Dotfiles

These are my dotfiles. I use a [bare Git repo] and [Nix] to manage them and
make them available across different systems.

## History

I initially commited to this repository seven years ago, and proceeded to
interminably shave the proverbial yak. I experimented, failed, and learned. I
moved from Vim to Neovim to Emacs to Neovim to VS Code and back to Neovim. I
tried different terminals and window managers. I made various improvements
around automation.

An unfortunate hallmark of this journey way was that I never really bothered
with meaningful commit mesages. Things were typically just “updated” or a
“WIP”. This was intentional—usually I was just trying to get things working the
way I wanted so I could get back to work. I was in pure experimentation mode,
curious and reckless.

Over time, I stopped relying on copy-pasted modifications and became more
thoughtful about edits and updates. I made sure I planned out and understood
what changes I was making and why, but still never put effort into the commit
messages—perhaps because of the historical precedent, or maybe because I was
always in too much of a rush.

In an effort to keep a more useful change log moving forward, I decided to wipe
out all commits in the [`main`] branch and begin the history anew. For posterity,
all commits made prior to this change are available in the [`archives`] branch.

## License

This project is released under the [GNU General Public License v3.0][license].

[bare Git repo]: https://www.atlassian.com/git/tutorials/dotfiles
[Nix]: https://nixos.org/
[neovim]: https://neovim.io/
[kitty]: https://sw.kovidgoyal.net/kitty/
[tmux]: https://github.com/tmux/tmux
[zsh]: https://www.zsh.org/
[runtime files]: https://github.com/ngscheurich/dotfiles/tree/main/nvim/.config/nvim
[`main`]: https://github.com/ngscheurich/dotfiles/tree/main
[`archives`]: https://github.com/ngscheurich/dotfiles/tree/archives
[license]: https://github.com/ngscheurich/dotfiles/blob/main/LICENSE
