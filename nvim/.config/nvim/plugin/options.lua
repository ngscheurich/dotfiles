-- ==========================================================
-- Options
-- ==========================================================

local opt = vim.opt

opt.cursorline     = true                -- Highlight the screen line of the cursor with CursorLine
opt.expandtab      = true                -- Use the appropriate number of spaces to insert a <Tab>
opt.fillchars      = "vert:│"            -- Characters to fill the statuslines and vertical separators
opt.foldlevel      = 99                  -- Don't open files with folds closed
opt.foldmethod     = "marker"            -- Markers are used to specify folds
opt.grepprg        = "rg --vimgrep"      -- Use ripgrep backend for the `:grep` command
opt.hidden         = true                -- Don't unload buffers when they become abandoned
opt.ignorecase     = true                -- Ignore case in search patterns
opt.inccommand     = "split"             -- Show partial off-screen substitutions in a preview window
opt.mouse          = "n"                 -- Enable the mouse in normal mode
opt.showmode       = false               -- Hide mode indicator
opt.swapfile       = false               -- Don't use swapfiles
opt.number         = true                -- Print the line number in front of the current line
opt.relativenumber = true                -- Show the cursor-relative line number in front of each line
opt.scrolloff      = 10                  -- Keep at least 10 screen lines above and below the cursor
opt.shiftwidth     = 2                   -- Number of spaces to use for each step of (auto)indent
opt.shortmess      = opt.shortmess + "c" -- Don't give `ins-completion-menu` messages
opt.signcolumn     = "yes"               -- Always show the signcolumn
opt.smartcase      = true                -- Override `ignorecase` if the pattern contains upper case characters
opt.smartindent    = true                -- Do smart autoindenting when starting a new line
opt.softtabstop    = 2                   -- Number of spaces that a <Tab> counts for while editing
opt.splitbelow     = true                -- Horizontal splits appear below the current window
opt.splitright     = true                -- Vertical splits appear to the right of the current window
opt.tabstop        = 2                   -- Number of spaces that a <Tab> counts for
opt.termguicolors  = true                -- Enables 24-bit RGB color in the TUI
opt.undofile       = true                -- Persist undo history and restore on buffer read
opt.updatetime     = 1000                -- Milliseconds after which to trigger swap write/CursorHold

-- Set chars for drawing whitespace
opt.listchars = {
  tab      = ">-",
  eol      = "↵",
  nbsp     = "␣",
  trail    = "‧" ,
  extends  = "⟩",
  precedes = "⟨",
}

-- Improve completion experience:
-- * Use a popup menu to show possible completions
-- * Only show popup menu when there is more than one match
-- * Don't insert anything until a match is selected
-- * Don't automatically select a match
opt.completeopt = {"menu", "menuone", "noinsert", "noselect"}
