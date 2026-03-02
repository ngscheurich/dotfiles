local nmap, nmap_leader = Config.nmap, Config.nmap_leader

Config.later(function()
  vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

  local gitsigns = require("gitsigns")

  gitsigns.setup({
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      changedelete = { text = "┃" },
      delete = { text = "┃" },
      topdelete = { text = "┃" },
      untracked = { text = "┇" },
    },
    signs_staged_enable = false,
  })

  nmap_leader("gb", gitsigns.toggle_current_line_blame, "Line blame (toggle)")
  -- nmap_leader("gB", "<Cmd>Git blame<CR>", "Blame buffer")
  nmap_leader("gd", gitsigns.preview_hunk_inline, "Deleted (toggle)")
  nmap_leader("gh", gitsigns.toggle_linehl, "Line highlight (toggle)")
  nmap_leader("gp", gitsigns.preview_hunk, "Preview hunk")
  nmap_leader("gr", gitsigns.reset_hunk, "Reset hunk")

  nmap("[h", function() gitsigns.nav_hunk("prev") end, "Previous hunk")
  nmap("]h", function() gitsigns.nav_hunk("next") end, "Next hunk")
  nmap("[H", function() gitsigns.nav_hunk("first") end, "First hunk")
  nmap("]H", function() gitsigns.nav_hunk("last") end, "Last hunk")
end)
