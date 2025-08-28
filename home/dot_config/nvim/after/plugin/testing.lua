-- Neotest
local function load_neotest()
  local neotest_ok, neotest = pcall(require, "neotest")
  if neotest_ok then
    ---@diagnostic disable-next-line
    neotest.setup({
      adapters = { require("neotest-elixir") },
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
  end
end

vim.api.nvim_create_autocmd("FileType", {
  desc = "Load Neotest",
  group = vim.api.nvim_create_augroup("ngs.packages.neotest", {}),
  pattern = { "elixir" },
  callback = function()
    if not package.loaded["neotest"] then
      load_neotest()
    end
  end,
})
