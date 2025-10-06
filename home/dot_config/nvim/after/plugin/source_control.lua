local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if gitsigns_ok then
  gitsigns.setup({
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      changedelete = { text = "┃" },
      delete = { text = "┃" },
      topdelete = { text = "┃" },
      untracked = { text = "┇" },
    },
  })

  vim.keymap.set("n", "<Leader>gb", gitsigns.toggle_current_line_blame, { desc = "Line blame (toggle)" })
  vim.keymap.set("n", "<Leader>gd", gitsigns.preview_hunk_inline, { desc = "Deleted (toggle)" })
  vim.keymap.set("n", "<Leader>gh", gitsigns.toggle_linehl, { desc = "Line highlight (toggle)" })
  vim.keymap.set("n", "<Leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
  vim.keymap.set("n", "<Leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })

  vim.keymap.set("n", "[h", function()
    gitsigns.nav_hunk("prev")
  end, { desc = "Previous hunk" })

  vim.keymap.set("n", "]h", function()
    gitsigns.nav_hunk("next")
  end, { desc = "Next hunk" })

  vim.keymap.set("n", "[H", function()
    gitsigns.nav_hunk("first")
  end, { desc = "First hunk" })

  vim.keymap.set("n", "]H", function()
    gitsigns.nav_hunk("last")
  end, { desc = "Last hunk" })
end
