# Prezto!
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Lunchy
LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
fi

# Less Colors for Man Pages
# http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;33;246m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Editor
export EDITOR='emacsclient'

# Get rid of lag when entering vi mode
export KEYTIMEOUT=1

# Powerline
if [[ ${OSTYPE//[0-9.]/} == "darwin" ]]; then
  export POWERLINE_ROOT="$HOME/Library/Python/2.7/lib/python/site-packages/powerline"
fi

# Aliases
alias boilerplate="curl -LO https://raw.githubusercontent.com/ngscheurich/boilerplate/master/README.md; curl -LO https://raw.githubusercontent.com/ngscheurich/boilerplate/master/LICENSE"
alias curlh="curl -s -D - -o /dev/null"
alias dcbundle="docker-compose run app bundle"
alias dcrails="docker-compose run app bin/rails"
alias dcrake="docker-compose run app bin/rake"
alias dcrspec="docker-compose run app bundle exec rspec"
alias emacs='/usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.15/bin/emacs'
alias emacsclient='/usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.15/bin/emacsclient'
alias emc="emacsclient"
alias fuck='eval $(thefuck $(fc -ln -1))'
alias git=hub
alias rbweb="ruby -run -e httpd . -p 5000"
alias rmdangling='docker rmi --force $(docker images -q -f dangling=true)'
alias rspec="bundle exec rspec"
alias sctl="sudo systemctl "
alias vboxls="VBoxManage list runningvms"
alias vim="/usr/local/Cellar/macvim/8.0-110/MacVim.app/Contents/MacOS/Vim"
alias weather="curl wttr.in/Baton+Rouge"
alias zshconfig="$EDITOR ~/.zshrc"
alias zshsource="source ~/.zshrc"

# Vagrant niceties
function vrails {
  vagrant ssh -c "cd /vagrant && bin/rails $@"
}

function vrake {
  vagrant ssh -c "cd /vagrant && bin/rake $@"
}

# DNVM stuff
source dnvm.sh

# Key Bindings
# https://github.com/JeanMertz/omz-to-prezto/blob/omz-to-prezto/zsh/key-bindings.zsh
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets
bindkey -v                                          # Use vi key bindings
bindkey '\ew' kill-region                           # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                             # [Esc-l] - run command: ls
bindkey -s '\e.' '..\n'                             # [Esc-.] - run command: .. (up directory)
bindkey '^r' history-incremental-search-backward    # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey '^[[5~' up-line-or-history                  # [PageUp] - Up a line of history
bindkey '^[[6~' down-line-or-history                # [PageDown] - Down a line of history
bindkey '^[[A' up-line-or-search                    # start typing + [Up-Arrow] - fuzzy find history forward
bindkey '^[[B' down-line-or-search                  # start typing + [Down-Arrow] - fuzzy find history backward
bindkey '^[[H' beginning-of-line                    # [Home] - Go to beginning of line
bindkey '^[[1~' beginning-of-line                   # [Home] - Go to beginning of line
bindkey '^[OH' beginning-of-line                    # [Home] - Go to beginning of line
bindkey '^[[F'  end-of-line                         # [End] - Go to end of line
bindkey '^[[4~' end-of-line                         # [End] - Go to end of line
bindkey '^[OF' end-of-line                          # [End] - Go to end of line
bindkey ' ' magic-space                             # [Space] - do history expansion
bindkey '^[[1;5C' forward-word                      # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                     # [Ctrl-LeftArrow] - move backward one word
# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char                   # [Delete] - delete backward
bindkey '^[[3~' delete-char                         # [fn-Delete] - delete forward
bindkey '^[3;5~' delete-char
bindkey '\e[3~' delete-char