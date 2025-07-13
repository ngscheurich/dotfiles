# Set command line key bindings
set -g fish_key_bindings fish_hybrid_key_bindings

# Suppress greeing message
set -g fish_greeting

# Set up Homebrew
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_NO_AUTO_UPDATE true
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
fish_add_path -gmp "/opt/homebrew/bin" "/opt/homebrew/sbin";
if test -n "$MANPATH[1]"; set -gx MANPATH '' $MANPATH; end;
if not contains "/opt/homebrew/share/info" $INFOPATH
  set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH
end

# Export global environment variables
set -gx BROWSER open
set -gx EDITOR nvim
set -gx ERL_AFLAGS '-kernel shell_history enabled'
set -gx GPG_TTY (tty)
set -gx KERL_CONFIGURE_OPTIONS --without-javac
set -gx PLAYDATE_SDK_PATH $HOME/Developer/PlaydateSDK/
set -gx SCRIPTS_DIR /etc/system/scripts
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

# Add directories to path
fish_add_path -gmp "$HOME/.local/bin"

# Source system-local environment
if [ -e "$HOME/.env" ]
  source "$HOME/.env"
end

# Abbreviations
abbr -a cls clear
abbr -a cm chezmoi
abbr -a G lazygit
abbr -a g git
abbr -a gP git push
abbr -a ga git add
abbr -a gci git commit
abbr -a gcl git clone
abbr -a gco git checkout
abbr -a gsw git switch
abbr -a gd git diff
abbr -a gg git log --all --decorate --oneline --graph
abbr -a gl git log --oneline
abbr -a gp git pull
abbr -a gr git rebase
abbr -a gs git status
abbr -a l eza
abbr -a ls eza
abbr -a la eza --all --long
abbr -a ll eza --long
abbr -a lt eza --tree
abbr -a n nvim
abbr -a ns nvim -S
abbr -a serve python -m http.server
abbr -a vimdiff nvim -d
abbr -a weather curl wttr.in
abbr -a tx tmux
abbr -a ta tmux attach -t

# Load theme
source "$HOME/.theme/shell.fish"

# Initialize pay-respects
pay-respects fish --alias | source

# Initialize Starship
starship init fish | source
