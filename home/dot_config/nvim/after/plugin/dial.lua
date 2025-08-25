-- ===================================================================
--  dial.nvim
-- -------------------------------------------------------------------
--  https://github.com/monaqa/dial.nvim
--  Enhanced increment/decrement
--  editing
-- -------------------------------------------------------------------
MiniDeps.add("https://github.com/monaqa/dial.nvim")

local function dial_map(mode, lhs, direction, dial_mode, opts)
  vim.keymap.set(mode, lhs, function()
    require("dial.map").manipulate(direction, dial_mode)
  end, opts)
end

dial_map("n", "<C-a>", "increment", "normal", { desc = "Increment" })
dial_map("n", "<C-x>", "decrement", "normal", { desc = "Decrement" })
dial_map("n", "g<C-a>", "increment", "gnormal", { desc = "Increment" })
dial_map("n", "g<C-x>", "decrement", "gnormal", { desc = "Decrement" })
dial_map("v", "<C-a>", "increment", "visual", { desc = "Increment" })
dial_map("v", "<C-x>", "decrement", "visual", { desc = "Decrement" })
dial_map("v", "g<C-a>", "increment", "gvisual", { desc = "Increment" })
dial_map("v", "g<C-x>", "decrement", "gvisual", { desc = "Decrement" })
