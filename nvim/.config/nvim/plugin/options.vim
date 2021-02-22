" ----------------------------------------------------------
" Options
" ----------------------------------------------------------

set cursorline            " Highlight the screen line of the cursor with CursorLine
set expandtab             " Use the appropriate number of spaces to insert a <Tab>
set fillchars+=vert:│     " Characters to fill the statuslines and vertical separators
set foldlevel=99          " Don't open files with folds closed
set foldmethod=indent     " Markers are used to specify folds
set grepprg=rg\ --vimgrep " Use ripgrep backend for the `:grep` command
set ignorecase            " Ignore case in search patterns
set inccommand=split      " Show partial off-screen substitutions in a preview window
set number                " Print the line number in front of the current line
set relativenumber        " Show the cursor-relative line number in front of each line
set scrolloff=10          " Keep at least 10 screen lines above and below the cursor
set shiftwidth=2          " Number of spaces to use for each step of (auto)indent
set shortmess+=c          " Don't give `ins-completion-menu` messages
set noshowmode            " Hide mode indicator
set signcolumn=yes:2      " Always show the signcolumn with two spaces
set smartcase             " Override `ignorecase` if the pattern contains upper case characters
set smartindent           " Do smart autoindenting when starting a new line
set softtabstop=2         " Number of spaces that a <Tab> counts for while editing
set splitbelow            " Vertically splits appear below the current window
set splitright            " Vertically splits appear to the right of the current window
set noswapfile            " Don't use swapfiles
set tabstop=2             " Number of spaces that a <Tab> in the file counts for
set termguicolors         " Enables 24-bit RGB color in the `TUI`
set undofile              " Persist undo history and restore on buffer read
set updatetime=1000       " Milliseconds after which to trigger swap write/`CursorHold`

" Improve completion experience:
" - Only show popup menu when there is more than one match
" - Don't insert anything until a match is selected
" - Don't automatically select a match
set completeopt=menuone,noinsert,noselect
