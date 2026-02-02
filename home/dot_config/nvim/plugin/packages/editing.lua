-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  dial.nvim                                      │  editing            │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Enhanced increment/decrement                                          │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("monaqa/dial.nvim")

  local dial_map = require("dial.map")

  local function map(mode, lhs, direction, dial_mode, opts)
    vim.keymap.set(mode, lhs, function()
      dial_map.manipulate(direction, dial_mode)
    end, opts)
  end

  map("n", "<C-a>", "increment", "normal", { desc = "Increment" })
  map("n", "<C-x>", "decrement", "normal", { desc = "Decrement" })
  map("n", "g<C-a>", "increment", "gnormal", { desc = "Increment" })
  map("n", "g<C-x>", "decrement", "gnormal", { desc = "Decrement" })
  map("v", "<C-a>", "increment", "visual", { desc = "Increment" })
  map("v", "<C-x>", "decrement", "visual", { desc = "Decrement" })
  map("v", "g<C-a>", "increment", "gvisual", { desc = "Increment" })
  map("v", "g<C-x>", "decrement", "gvisual", { desc = "Decrement" })
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  flash.nvim                                     │  editing            │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Navigate using search labels                                          │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("folke/flash.nvim")

  require("flash").setup({
    modes = {
      char = { jump_labels = false },
      search = { enabled = false },
    },
    prompt = {
      prefix = { { "󱐋", "FlashPromptIcon" } },
    },
  })

  local function map(modes, lhs, action, opts)
    vim.keymap.set(modes, lhs, function()
      require("flash")[action]()
    end, opts)
  end

  map({ "n", "x", "o" }, "s", "jump", { desc = "Flash" })
  map({ "n", "x", "o" }, "S", "treesitter", { desc = "Flash (TS)" })
  map("o", "r", "remote", { desc = "Flash (Remote)" })
  map({ "x", "o" }, "R", "treesitter_search", { desc = "Flash (TS Search)" })
  map("c", "<C-z>", "toggle", { desc = "Flash (Toggle)" })
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  mini.align                                     │  editing            │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Align text interactively                                              │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add({
    source = "https://github.com/echasnovski/mini.align",
    checkout = "stable",
  })
  require("mini.align").setup()
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  nvim-autopairs                                 │  editing            │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Automatically insert the other half of a character pair               │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("https://github.com/windwp/nvim-autopairs")
  require("nvim-autopairs").setup()
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  mini.surround                                  │  editing            │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Actions for operating on surrounding pairs                            │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add({
    source = "https://github.com/echasnovski/mini.surround",
    checkout = "stable",
  })
  require("mini.surround").setup({
    mappings = {
      add = "gsa",
      delete = "gsd",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      replace = "gsr",
      update_n_lines = "gsn",
      suffix_last = "l",
      suffix_next = "n",
    },
  })
end)

-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  multicursor.nvim                               │  editing            │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Multiple cursor editing                                               │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("jake-stewart/multicursor.nvim")
  local multicursor = require("multicursor-nvim")
  multicursor.setup()

  vim.keymap.set({ "n", "x" }, "<LocalLeader>n", function()
    multicursor.matchAddCursor(1)
  end, { desc = "Add cursor forward" })
  vim.keymap.set({ "n", "x" }, "<LocalLeader>s", function()
    multicursor.matchSkipCursor(1)
  end, { desc = "Skip cursor forward" })
  vim.keymap.set({ "n", "x" }, "<LocalLeader>N", function()
    multicursor.matchAddCursor(-1)
  end, { desc = "Add cursor backward" })
  vim.keymap.set({ "n", "x" }, "<LocalLeader>S", function()
    multicursor.matchSkipCursor(-1)
  end, { desc = "Skip cursor backward" })

  vim.keymap.set({ "n", "x" }, "<LocalLeader>q", multicursor.toggleCursor, { desc = "Toggle multiple cursors" })

  multicursor.addKeymapLayer(function(layerSet)
    layerSet("n", "<Esc>", function()
      if not multicursor.cursorsEnabled() then
        multicursor.enableCursors()
      else
        multicursor.clearCursors()
      end
    end)
  end)
end)
