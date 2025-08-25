-- ===================================================================
--  Neotest
-- -------------------------------------------------------------------
--  https://github.com/nvim-neotest/neotest
--  Extensible framework for interacting with tests
--  testing
-- -------------------------------------------------------------------
MiniDeps.add({
  source = "nvim-neotest/neotest",
  depends = {
    "nvim-neotest/nvim-nio",
    "antoinemadec/FixCursorHold.nvim",
    "jfpedroza/neotest-elixir",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Load Neotest",
  group = vim.api.nvim_create_augroup("ngs.packages.neotest", {}),
  pattern = { "elixir" },
  callback = function()
    if not package.loaded["neotest"] then
      require("neotest").setup({
        adapters = { require("neotest-elixir") },
      })
    end
  end,
})

vim.keymap.set("n", "<LocalLeader>tn", function()
  require("neotest").run.run()
end, { desc = "Nearest" })

vim.keymap.set("n", "<LocalLeader>tt", function()
  require("neotest").run.run_last()
end, { desc = "Last" })

vim.keymap.set("n", "<LocalLeader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "File" })

vim.keymap.set("n", "<LocalLeader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Summary (toggle)" })

vim.keymap.set("n", "<LocalLeader>tp", function()
  require("neotest").output_panel.toggle()
end, { desc = "Output panel (toggle)" })
