-- =============================================================================
--  Options
-- -----------------------------------------------------------------------------

-- Behavior --------------------------------------------------------------------
vim.opt.mouse = "a"
vim.opt.shada = "'100,<50,s10,:1000,/100,@100,h"
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"

-- Interface -------------------------------------------------------------------
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.listchars =
  "eol:↵,tab:>-,space:·,lead:·,trail:‧,extends:⟩,precedes:⟨,nbsp:␣"
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.shortmess = "ltToOCFW"
vim.opt.signcolumn = "yes"
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true

-- Indentation -----------------------------------------------------------------
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2

-- Search ----------------------------------------------------------------------
if vim.fn.executable("rg") == 1 then vim.opt.grepprg = "rg" end
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Completion ------------------------------------------------------------------
vim.opt.completeopt = "menuone,noselect,fuzzy"

-- Folding ---------------------------------------------------------------------
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99
