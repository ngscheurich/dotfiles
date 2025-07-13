-- ===================================================================
--  oil.nvim
-- -------------------------------------------------------------------
--  https://github.com/stevearc/oil.nvim
--  Explore the filesystem and edit it like a buffer
--  workflow
-- -------------------------------------------------------------------
return {
  "stevearc/oil.nvim",
  dependencies = { { "echasnovski/mini.icons", opts = {} } },

  config = function()
    local detail = false
    require("oil").setup({
      keymaps = {
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
    })
    vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
  end,
}
