-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  opencode.nvim                                  │  gen-ai             │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Integration with opencode AI coding agent                             │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add("NickvanDyke/opencode.nvim")

  local function map(mode, lhs, call_data, opts)
    local name, arg = call_data[1], call_data[2]
    vim.keymap.set(mode, lhs, function()
      require("opencode")[name](arg)
    end, opts)
  end

  map("n", "<Leader>ao", { "toggle" }, { desc = "Toggle opencode" })
  map("n", "<Leader>aa", { "ask" }, { desc = "Ask opencode" })
  map("n", "<Leader>ac", { "ask", "@cursor: " }, { desc = "Ask opencode at cursor" })
  map("v", "<Leader>as", { "ask", "@selection: " }, { desc = "Ask opencode about selection" })
  map("n", "<Leader>an", { "command", "session_new" }, { desc = "New opencode session" })
  map("n", "<Leader>ay", { "command", "messages_copy" }, { desc = "Copy last opencode message" })
  map("n", "<Leader>ae", { "prompt", "Explain @cursor and its context" }, { desc = "Explain code at cursor" })
  map({ "n", "v" }, "<Leader>ap", { "select_prompt" }, { desc = "Select opencode prompt" })
  map("n", "<C-S-U", { "command", "messages_half_page_up" }, { desc = "Scroll opencode messages up" })
  map("n", "<C-S-D>", { "command", "messages_half_page_down" }, { desc = "Scroll opencode messages down" })
end)
