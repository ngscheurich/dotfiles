-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  Projectionist                                  │  workflow           │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Project configuration and actions                                     │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("tpope/vim-projectionist")
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  chezmoi.nvim                                   │  workflow           │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Edit and apply chezmoi-managed files                                  │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.now(function()
  MiniDeps.add("xvzc/chezmoi.nvim")
  vim.g["chezmoi#use_tmp_buffer"] = true
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  mini.bracketed                                 │  workflow           │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Move back and forth between locations                                 │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add({
    source = "https://github.com/echasnovski/mini.bracketed",
    checkout = "stable",
  })
  require("mini.bracketed").setup()
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  oil.nvim                                       │  workflow           │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Explore the filesystem and edit it like a buffer                      │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.now(function()
  MiniDeps.add("stevearc/oil.nvim")
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
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  quicker.nvim                                   │  workflow           │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Improved UI and workflow for the quickfix list                        │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("stevearc/quicker.nvim")

  vim.api.nvim_create_autocmd("FileType", {
    desc = "Load quicker.nvim",
    group = vim.api.nvim_create_augroup("ngs.packages.quicker", {}),
    pattern = "qf",
    callback = function()
      if not package.loaded["quicker"] then
        require("quicker").setup()
      end
    end,
  })
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  rsi.vim                                        │  misc               │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Readline-style mappings                                               │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("tpope/vim-rsi")
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  vim-slime                                      │  workflow           │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Send buffer contents to external targets                              │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("jpalardy/vim-slime")
  vim.g.slime_target = "tmux"
end)
