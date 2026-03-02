local add = vim.pack.add
local later, nmap, nmap_leader, now, on_event =
  Config.later, Config.nmap, Config.nmap_leader, Config.now, Config.on_event

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  bufferline.nvim                                │  ui                   │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  A bufferline to display tabs                                            │
-- ┖───────────────────────────────────────────────────────────────────────────┘
-- FIXME: Close bufferline when tab count is reduced to 1
on_event("TabEnter,TabNew,TabNewEntered", function()
  add({ "https://github.com/akinsho/bufferline.nvim" })

  require("bufferline").setup({
    options = {
      mode = "tabs",
      indicator = { icon = "┃" },
    },
  })
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  dropbar.nvim                                   │  ui                   │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Documents breadcrumbs bar                                               │
-- ┖───────────────────────────────────────────────────────────────────────────┘
later(function()
  add({ "https://github.com/Bekaboo/dropbar.nvim" })

  require("dropbar").setup({ bar = { enable = false } })

  nmap_leader("tb", function()
    if vim.o.winbar == "" then
      vim.opt.winbar = "%{%v:lua.dropbar()%}"
    else
      vim.opt.winbar = ""
    end
  end, "Breadcrumbs")
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  Fidget                                         │  ui                   │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Displays prpgress messages                                              │
-- ┖───────────────────────────────────────────────────────────────────────────┘
on_event("LspProgress", function()
  add({ "https://github.com/j-hui/fidget.nvim" })
  require("fidget").setup({ progress = { display = { done_icon = "" } } })
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  Heirline                                       │  ui                   │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Status line framework                                                   │
-- ┖───────────────────────────────────────────────────────────────────────────┘
now(function()
  add({ "https://github.com/rebelot/heirline.nvim" })
  require("ngs.statusline").setup()
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  Trouble                                        │  ui                   │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Interactive diagnostics listing                                         │
-- ┖───────────────────────────────────────────────────────────────────────────┘
later(function()
  add({ "https://github.com/folke/trouble.nvim" })

  require("trouble").setup()

  nmap_leader(
    "db",
    "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>",
    "Buffer"
  )
  nmap_leader("dw", "<Cmd>Trouble diagnostics toggle<CR>", "Workspace")
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  WhichKey                                       │  ui                   │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Shows available keymaps as you type                                     │
-- ┖───────────────────────────────────────────────────────────────────────────┘
later(function()
  add({ "https://github.com/folke/which-key.nvim" })

  local which_key = require("which-key")
  which_key.setup({ icons = { mappings = false } })
  which_key.add({
    { "<Leader>d", group = "Diagnostics" },
    { "<Leader>f", group = "Find" },
    { "<Leader>g", group = "Git" },
    { "<Leader>n", group = "Notes" },
    { "<Leader>p", group = "Pick" },
    { "<Leader>s", group = "Sessions" },
    { "<Leader>t", group = "Toggle" },
    { "<LocalLeader>t", group = "test" },
  })
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  nvim-ufo                                       │  ui                   │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  High-performance folds with a modern look                               │
-- ┖───────────────────────────────────────────────────────────────────────────┘
later(function()
  add({
    "https://github.com/kevinhwang91/promise-async",
    "https://github.com/kevinhwang91/nvim-ufo",
  })

  local ufo = require("ufo")

  vim.o.foldmethod = "manual"
  vim.o.foldcolumn = "1"
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true

  ufo.setup()

  nmap("zR", ufo.openAllFolds, "Open all folds")
  nmap("zM", ufo.closeAllFolds, "Close all folds")
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  tint-glimmer.nvim                              │  ui                   │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Adds a subtle animation to various editing operations                   │
-- ┖───────────────────────────────────────────────────────────────────────────┘
later(function()
  add({ "https://github.com/rachartier/tiny-glimmer.nvim" })

  require("tiny-glimmer").setup({
    animations = {
      fade = {
        max_duration = 600,
        min_duration = 500,
        from_color = "PMenuSel",
        to_color = "CursorLine",
      },
    },
    overwrite = {
      search = { enabled = true },
      undo = { enabled = true },
      redo = { enabled = true },
    },
  })
end)

-- ┎──────────────────────────────────────────────────┬────────────────────────┐
-- ┃  Aerial                                         │  ui                   │
-- ┠──────────────────────────────────────────────────┴────────────────────────┤
-- ┃  Code outline window                                                     │
-- ┖───────────────────────────────────────────────────────────────────────────┘
later(function()
  add({ "https://github.com/stevearc/aerial.nvim" })

  local aerial = require("aerial")
  aerial.setup({
    on_attach = function(buffer)
      vim.keymap.set("n", "}", "<Cmd>AerialNext<CR>", { buffer = buffer })
      vim.keymap.set("n", "{", "<Cmd>AerialPrev<CR>", { buffer = buffer })
    end,
  })

  nmap_leader("o", "<Cmd>AerialToggle!<CR>", "Outline")
end)
