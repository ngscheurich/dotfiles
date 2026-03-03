local add = vim.pack.add
local now_if_args, on_filetype = Config.now_if_args, Config.on_filetype

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  oil.nvim                                       │  workflow             │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃   Explore the filesystem and edit it like a buffer                       │
-- ┖───────────────────────────────────────────────────────────────────────────┘
now_if_args(function()
  add({ "https://github.com/stevearc/oil.nvim" })

  local detail = false

  require("oil").setup({
    keymaps = {
      ["gd"] = {
        desc = "Toggle file detail view",
        callback = function()
          detail = not detail
          if detail then
            require("oil").set_columns({
              "icon",
              "permissions",
              "size",
              "mtime",
            })
          else
            require("oil").set_columns({ "icon" })
          end
        end,
      },
    },
  })

  vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  quicker.nvim                                   │  workflow, ui         │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Improved UI and workflow for the quickfix list                          │
-- ┖───────────────────────────────────────────────────────────────────────────┘
on_filetype("qf", function()
  add({ "https://github.com/stevearc/quicker.nvim" })
  require("quicker").setup()
end)
