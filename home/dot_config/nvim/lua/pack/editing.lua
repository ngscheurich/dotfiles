local add = vim.pack.add
local later = Config.later

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  flash.nvim                                     │  editing              │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Navigate and operate remotely using search labels                       │
-- ┖───────────────────────────────────────────────────────────────────────────┘
later(function()
  add({ "https://github.com/folke/flash.nvim" })

  require("flash").setup({
    modes = {
      char = { jump_labels = false },
      search = { enabled = false },
    },
    prompt = {
      prefix = { { "󱐋", "FlashPromptIcon" } },
    },
  })

  local function map(modes, lhs, action, desc)
    vim.keymap.set(
      modes,
      lhs,
      function() require("flash")[action]() end,
      { desc = desc }
    )
  end

  map({ "n", "x", "o" }, "s", "jump", "Flash")
  map({ "n", "x", "o" }, "S", "treesitter", "Flash (TS)")
  map("o", "r", "remote", "Flash (Remote)")
  map({ "x", "o" }, "R", "treesitter_search", "Flash (TS Search)")
  map("c", "<C-z>", "toggle", "Flash (Toggle)")
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  nvim-autopairs                                 │  editing              │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Intelligently inserts the other half of a paired symbol                 │
-- ┖───────────────────────────────────────────────────────────────────────────┘
later(function()
  add({ "https://github.com/windwp/nvim-autopairs" })
  require("nvim-autopairs").setup()
end)
