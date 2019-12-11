scriptencoding utf-8

" ==============================================================================
" Plugins
" ==============================================================================
"
" Author: N. G. Scheurich <nick@scheurich.me>
" Repo: https://github.com/ngscheurich/dotfiles

" If vim-plug isn't installed, install it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/vim/plugged')

" Defaults
" ------------------------------------------------------------------------------
Plug 'tpope/vim-sensible'           " Defaults everyone can agree on

" Interface
" ------------------------------------------------------------------------------
Plug 'edkolev/tmuxline.vim'         " Simple tmux statusline generator
Plug 'fatih/molokai'                " A simple, classic color scheme
Plug 'itchyny/lightline.vim'        " A light and configurable statusline/tabline
Plug 'mhartington/oceanic-next'     " Port of Oceanic Next by Dmitri Voronianski
Plug 'mhinz/vim-startify'           " The fancy start screen for Vim
Plug 'morhetz/gruvbox'              " Retro groove color scheme
Plug 'rakr/vim-one'                 " TODO
Plug 'rakr/vim-togglebg'            " Toggle background between light and dark
Plug 'rakr/vim-two-firewatch'       " Calm, duotone colorscheme with vibrant accents
Plug 'ryanoasis/vim-devicons'       " Adds file type glyphs/icons
Plug 'scrooloose/nerdtree'          " File system explorer
Plug 'srcery-colors/srcery-vim'     " Color scheme with clearly defined contrasting colors and a slightly earthy tone

" Editing
" ------------------------------------------------------------------------------
Plug 'csexton/trailertrash.vim'     " Identify and irradicate unwanted EOL whitespace
Plug 'jiangmiao/auto-pairs'         " Insert or delete brackets, parens, and quotes in pairs
Plug 'justinmk/vim-sneak'           " Jump to any location specified by two characters
Plug 'tpope/vim-abolish'            " Operate on variants of a word (plural, case, etc.)
Plug 'tpope/vim-commentary'         " Toggle comments
Plug 'tpope/vim-endwise'            " End coding structures automatically, e.g., `do`...`end`
Plug 'tpope/vim-repeat'             " Enable repeating supported plugin maps with `.`
Plug 'tpope/vim-sleuth'             " Heuristically set buffer indentation options
Plug 'tpope/vim-speeddating'        " Use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-surround'           " Operate on, e.g., parentheses, brackets, quotes
Plug 'tpope/vim-unimpaired'         " Complementary key mappings based around [ and ]

" Source control
" ------------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'           " A Git wrapper so awesome it should be illegal
Plug 'airblade/vim-gitgutter'       " Shows a Git diff in the gutter and stages/undoes hunks

" Intellisense
" ------------------------------------------------------------------------------
Plug 'neoclide/coc.nvim',
      \ {'branch': 'release'}       " Intellisense engine with full LSP support

"" Languages and Frameworks
"------------------------------------------------------------------------------
Plug 'HerringtonDarkholme/yats.vim' " TypeScript
Plug 'elixir-editors/vim-elixir'    " Elixir
Plug 'jparise/vim-graphql'          " GraphQL
Plug 'sheerun/vim-polyglot'         " A solid language pack

" Tooling
" ------------------------------------------------------------------------------
Plug '/usr/local/opt/fzf'           " Location of fzf binary
Plug 'Shougo/denite.nvim'           " Generic fuzzy finder
Plug 'diepm/vim-rest-console'       " A REST console
Plug 'janko-m/vim-test'             " Run your tests at the speed of thought
Plug 'junegunn/fzf.vim'             " Integrate with fzf
Plug 'tpope/vim-dispatch'           " Perform async tasks in a tmux split
Plug 'tpope/vim-eunuch'             " Sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-vinegar'            " Navigate up a directory in netrw
Plug 'diepm/vim-rest-console'

"""""
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
"""""


call plug#end()