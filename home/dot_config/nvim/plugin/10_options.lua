-- =============================================================================
--  Options
-- -----------------------------------------------------------------------------

-- Behavior --------------------------------------------------------------------
vim.o.mouse = "a"
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h"
vim.o.undofile = true
vim.o.clipboard = "unnamedplus"

-- Interface -------------------------------------------------------------------
vim.o.cursorline = true
vim.o.laststatus = 3
vim.o.linebreak = true
vim.o.listchars =
  "eol:↵,tab:>-,space:·,lead:·,trail:‧,extends:⟩,precedes:⟨,nbsp:␣"
vim.o.number = true
vim.o.pumheight = 10
vim.o.shortmess = "ltToOCFW"
vim.o.signcolumn = "yes"
vim.o.showmode = false
vim.o.splitbelow = true
vim.o.splitkeep = "screen"
vim.o.splitright = true
vim.o.wrap = false

-- Indentation -----------------------------------------------------------------
vim.o.breakindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2

-- Search ----------------------------------------------------------------------
if vim.fn.executable("rg") == 1 then vim.o.grepprg = "rg" end
vim.o.ignorecase = true
vim.o.smartcase = true

-- Completion ------------------------------------------------------------------
-- TODO: Try nosort
vim.o.completeopt = "menuone,noselect,fuzzy"

-- Folding ---------------------------------------------------------------------
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevelstart = 99
