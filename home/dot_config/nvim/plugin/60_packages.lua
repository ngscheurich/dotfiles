-- =============================================================================
--  Packages
-- -----------------------------------------------------------------------------
--
local add = vim.pack.add
local now = Config.now

require("pack.completion")
require("pack.editing")
require("pack.formatting")
require("pack.linting")
require("pack.lsp")
require("pack.mini")
require("pack.prose")
require("pack.snacks")
require("pack.tools")
require("pack.treesitter")
require("pack.ui")
require("pack.vcs")
require("pack.workflow")

-- Editor theme ----------------------------------------------------------------

now(function()
  add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    "https://github.com/rebelot/heirline.nvim",
    "file://" .. vim.env.HOME .. "/Developer/barista-nvim",
  })

  vim.g.barista = {
    notify = true,
    callback = function()
      package.loaded["ngs.statusline"] = nil
      require("ngs.statusline")
    end,
  }

  require("barista")
end)
