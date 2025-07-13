-- ===================================================================
--  obsidian.nvim
-- -------------------------------------------------------------------
--  https://github.com/obsidian-nvim/obsidian.nvim
--  Write in and navigate Obsidian vaults
--  notes
-- -------------------------------------------------------------------
local vault_path = vim.fn.expand("~") .. "/Vaults/Notes"

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",

  -- event = {
  --   "BufReadPre " .. vault_path .. "/*.md",
  --   "BufNewFile " .. vault_path .. "/*.md",
  -- },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "OXY2DEV/markview.nvim",
  },

  opts = {
    legacy_commands = false,

    workspaces = {
      {
        name = "Notes",
        path = vault_path,
      },
    },

    daily_notes = {
      folder = "journal",
    },

    completion = {
      nvim_cmp = false,
      blink = true,
    },

    note_id_func = function(title)
      return title or "Untitled"
    end,

    note_frontmatter_func = function(_note)
      return {}
    end,
  },

  cmd = "Obsidian",

  keys = {
    { "<Leader>nn", "<Cmd>Obsidian new<CR>", desc = "New note" },
    { "<Leader>nd", "<Cmd>Obsidian dailies<CR>", desc = "Open note" },
    { "<Leader>nt", "<Cmd>Obsidian today<CR>", desc = "Today's note" },
  },
}
