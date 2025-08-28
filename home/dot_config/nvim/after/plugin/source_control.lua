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
  -- TODO Deprecated
  vim.keymap.set("n", "<Leader>gd", gitsigns.toggle_deleted, { desc = "Deleted (toggle)" })
  vim.keymap.set("n", "<Leader>gh", gitsigns.toggle_linehl, { desc = "Line highlight (toggle)" })
  vim.keymap.set("n", "<Leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
  vim.keymap.set("n", "<Leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
  -- TODO Deprecated
  vim.keymap.set("n", "]h", gitsigns.next_hunk, { desc = "Next hunk" })
  -- TODO Deprecated
  vim.keymap.set("n", "[h", gitsigns.prev_hunk, { desc = "Previous hunk" })
end
