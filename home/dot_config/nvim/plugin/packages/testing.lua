-- ┌──────────────────────────────────────────────────┬──────────────────────┐
-- │  Neotest                                        │  testing            │
-- ├──────────────────────────────────────────────────┴──────────────────────┤
-- │  Extensible framework for interacting with tests                       │
-- └─────────────────────────────────────────────────────────────────────────┘
MiniDeps.later(function()
  MiniDeps.add({
    source = "nvim-neotest/neotest",
    depends = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "jfpedroza/neotest-elixir",
    },
  })

  local function load_neotest()
    local neotest = require("neotest")

    ---@diagnostic disable-next-line
    neotest.setup({
      adapters = { require("neotest-elixir") },
    })

    vim.keymap.set("n", "<LocalLeader>tn", function()
      neotest.run.run()
    end, { desc = "Nearest" })

    vim.keymap.set("n", "<LocalLeader>tt", function()
      neotest.run.run_last()
    end, { desc = "Last" })

    vim.keymap.set("n", "<LocalLeader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "File" })

    vim.keymap.set("n", "<LocalLeader>ts", function()
      neotest.summary.toggle()
    end, { desc = "Summary (toggle)" })

    vim.keymap.set("n", "<LocalLeader>tp", function()
      neotest.output_panel.toggle()
    end, { desc = "Output panel (toggle)" })
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
end)
