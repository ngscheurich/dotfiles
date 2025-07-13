-- ===================================================================
--  Gitsigns
-- -------------------------------------------------------------------
--  https://github.com/lewis6991/gitsigns.nvim
--  Git integration for buffers
--  source-control
-- -------------------------------------------------------------------
return {
  "lewis6991/gitsigns.nvim",

  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", "petertriho/nvim-scrollbar" },

  config = function()
    local gs = require("gitsigns")
    local sb_handler = require("scrollbar.handlers.search")
    local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

    gs.setup({
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        changedelete = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        untracked = { text = "┇" },
      },
    })

    vim.keymap.set(
      "n",
      "<Leader>gb",
      gs.toggle_current_line_blame,
      { desc = "Line blame (toggle)" }
    )
    vim.keymap.set("n", "<Leader>gd", gs.toggle_deleted, { desc = "Deleted (toggle)" })
    vim.keymap.set("n", "<Leader>gh", gs.toggle_linehl, { desc = "Line highlight (toggle)" })
    vim.keymap.set("n", "<Leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
    vim.keymap.set("n", "<Leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
    vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next hunk" })
    vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Previous hunk" })

    sb_handler.setup()

    local next_hunk_repeat, prev_hunk_repeat =
      ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
    vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
    vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)
  end,
}
