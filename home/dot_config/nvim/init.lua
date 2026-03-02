-- =============================================================================
--
--   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
--   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
--   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
--   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
--   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
--   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- -----------------------------------------------------------------------------

-- Enable experimental UI
vim.o.cmdheight = 0
require("vim._core.ui2").enable({
  enable = true,
  msg = { target = "msg", timeout = 2000 },
})

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- ┎────────────────────────────────────────────────┬──────────────────────────┐
-- ┃  mini.nvim                                    │  editing, ui, workflow  │
-- ┠────────────────────────────────────────────────┴──────────────────────────┤
-- ┃  Library of modules for improving the Neovim experience                  │
-- ┖───────────────────────────────────────────────────────────────────────────┘
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-- Load configuration helpers
require("ngs.config")

-- Default theme setup (overriden by `ngs.theme` plugin if available)
Config.theme = { apply = function(_) vim.cmd.colorscheme("minicyan") end }
