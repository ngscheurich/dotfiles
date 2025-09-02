local opencode_ok, opencode = pcall(require, "opencode")

if opencode_ok then
  opencode.setup(
    ---@type opencode.Opts
    {}
  )

  local function map(mode, lhs, call_data, opts)
    local name, arg = call_data[1], call_data[2]
    vim.keymap.set(mode, lhs, function()
      require("opencode")[name](arg)
    end, opts)
  end

  map("n", "<Leader>oA", { "ask" }, { desc = "Ask" })
  map("n", "<Leader>oa", { "ask", "@cursor: " }, { desc = "Ask near cursor" })
  map("v", "<Leader>oa", { "ask", "@selection: " }, { desc = "Ask about selection" })
  map("n", "<Leader>ot", { "toggle" }, { desc = "Toggle" })
  map("n", "<Leader>on", { "command", "session_new" }, { desc = "New session" })
  map("n", "<Leader>oy", { "command", "messages_copy" }, { desc = "Copy last message" })
  map("n", "<C-S-U", { "command", "messages_half_page_up" }, { desc = "Scroll messages up" })
  map("n", "<C-S-D>", { "command", "messages_half_page_down" }, { desc = "Scroll messages down" })
  map({ "n", "v" }, "<Leader>op", { "select_prompt" }, { desc = "Select prompt" })

  map("n", "<Leader>oe", { "prompt", "Explain @cursor and its context" }, { desc = "Explain code near cursor" })
end
