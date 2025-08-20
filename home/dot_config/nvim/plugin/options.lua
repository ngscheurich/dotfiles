vim.opt.conceallevel = 2
vim.opt.cursorline = true
vim.opt.fillchars = { vert = "\226\148\130" }
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

vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.smartcase = true

vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.pumheight = 10

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99

vim.opt.hidden = true
vim.opt.timeoutlen = 250
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.clipboard = "unnamedplus"
