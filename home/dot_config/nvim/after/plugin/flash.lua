-- ===================================================================
--  flash.nvim
-- -------------------------------------------------------------------
--  https://github.com/folke/flash.nvim
--  Navigate using search labels
--  editing
-- -------------------------------------------------------------------
MiniDeps.add("folke/flash.nvim")

require("flash").setup({
  modes = {
    char = {
      jump_labels = true,
    },
    search = {
      enabled = true,
    },
  },
  prompt = {
    prefix = { { "󱐋", "FlashPromptIcon" } },
  },
})

local function flash(modes, lhs, action, opts)
  vim.keymap.set(modes, lhs, function()
    require("flash")[action]()
  end, opts)
end

flash({ "n", "x", "o" }, "s", "jump", { desc = "Flash" })
flash({ "n", "x", "o" }, "S", "treesitter", { desc = "Flash (TS)" })
flash("o", "r", "remote", { desc = "Flash (Remote)" })
flash({ "x", "o" }, "R", "treesitter_search", { desc = "Flash (TS Search)" })
flash("c", "<C-z>", "toggle", { desc = "Flash (Toggle)" })
