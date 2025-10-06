-- dial.nvim
local dial_map_ok, dial_map = pcall(require, "dial.map")
if dial_map_ok then
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
end

-- flash.nvim
local flash_ok, flash = pcall(require, "flash")
if flash_ok then
  flash.setup({
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
end

-- mini.align
local align_ok, align = pcall(require, "mini.align")
if align_ok then
  align.setup()
end

-- mini.pairs
local pairs_ok, pairs = pcall(require, "mini.pairs")
if pairs_ok then
  pairs.setup()
end

-- mini.surround
local surround_ok, surround = pcall(require, "mini.surround")
if surround_ok then
  surround.setup({
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
end

local multicursor_ok, multicursor = pcall(require, "multicursor-nvim")
if multicursor_ok then
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
end
