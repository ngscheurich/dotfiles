-- =============================================================================
--  Options
-- -----------------------------------------------------------------------------

-- Interface
vim.opt.conceallevel = 2
vim.opt.cursorline = true
vim.opt.fillchars:append("vert:│")
vim.opt.fillchars:append("horiz:─")
vim.opt.fillchars:append("horizup:┴")
vim.opt.fillchars:append("horizdown:┬")
vim.opt.fillchars:append("vertleft:┤")
vim.opt.fillchars:append("vertright:├")
vim.opt.fillchars:append("verthoriz:┼")
vim.opt.laststatus = 3
vim.opt.listchars = {
  space = "·",
  tab = ">-",
  eol = "↵",
  nbsp = "␣",
  trail = "‧",
  extends = "⟩",
  precedes = "⟨",
}
vim.opt.number = true
vim.opt.scrolloff = 13
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.showmode = false

-- Indentation
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Search
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.smartcase = true

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.pumheight = 10

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99

-- Miscellaneous
vim.opt.hidden = true
vim.opt.timeoutlen = 250
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.clipboard = "unnamedplus"
