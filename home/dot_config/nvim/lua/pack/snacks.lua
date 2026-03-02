_G.Snacks = {}
local util = require("ngs.util")
local nmap, nmap_leader = util.nmap, util.nmap_leader

Config.now(function()
  vim.pack.add({ "https://github.com/folke/snacks.nvim" })

  require("snacks").setup({
    bigfile = { enabled = true },
    explorer = { enabled = true },
    gitbrowse = { enabled = true },
    image = { enabled = true },
    indent = { enabled = false, animate = { enabled = false } },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { left = { "git", "sign" }, right = { "fold", "mark" } },

    -- Distraction-free editing
    -- zen = {
    --   enabled = true,
    --   toggles = {
    --     dim = false,
    --     line_number = false,
    --   },
    --   on_open = function() vim.cmd("PencilSoft") end,
    --   win = {
    --     backdrop = { transparent = false },
    --   },
    -- },
  })

  -- Keymaps -------------------------------------------------------------------

  local function pick(lhs, func, desc, layout)
    if layout == nil then layout = "default" end
    nmap(lhs, function() Snacks.picker[func]({ layout = layout }) end, desc)
  end

  -- Picker: Quick
  pick("<C-f>", "files", "Files", "bottom")
  pick("<C-/>", "grep", "Grep", "bottom")
  pick("<C-.>", "lines", "Lines")
  pick("<C-Space>", "buffers", "Buffers", "select")

  -- Picker: General
  pick("<Leader><Leader>", "smart", "Smart files", "bottom")
  pick("<Leader>pr", "resume", "Resume picker")

  -- Picker: Find
  pick("<Leader>pf", "files", "Files")
  pick("<Leader>pg", "git_files", "Git files")
  pick("<Leader>pp", "projects", "Projects")
  pick("<Leader>pr", "recent", "Recent files")

  -- Picker: Search
  pick("<Leader>pa", "autocmds", "Autocommands")
  pick("<Leader>pB", "grep_buffers", "Grep buffers")
  pick("<Leader>p:", "command_history", "Command history")
  pick("<Leader>pc", "commands", "Commands")
  pick("<Leader>pD", "diagnostics", "Diagnostics")
  pick("<Leader>pd", "diagnostics_buffer", "Diagnostics (buffer)")
  pick("<Leader>ph", "help", "Help pages")
  pick("<Leader>pH", "highlights", "Highlights")
  pick("<Leader>pi", "icons", "Icons")
  pick("<Leader>pj", "jumps", "Jumps")
  pick("<Leader>pk", "keymaps", "Keymaps")
  pick("<Leader>pl", "loclist", "Location list")
  pick("<Leader>pM", "man", "Man pages")
  pick("<Leader>pm", "marks", "Marks")
  pick("<Leader>pn", "notifications", "Notification history", "bottom")
  pick("<Leader>pq", "qflist", "Quickfix list")
  pick("<Leader>p\\", "registers", "Registers")
  pick("<Leader>p/", "search_history", "Search history")
  pick("<Leader>pu", "undo", "Undo history")
  pick("<Leader>pw", "grep_word", "Words")

  -- Picker: Replacements
  pick("grr", "lsp_references", "References")
  pick("gO", "lsp_symbols", "Symbols")
  pick("gW", "lsp_workspace_symbols", "Symbols (workspace)")

  -- Other
  nmap_leader("e", function() Snacks.explorer.open() end, "Explore")

  nmap_leader("go", function() Snacks.gitbrowse() end, "Open on GitHub")

  nmap_leader("tz", function() Snacks.zen() end, "Zen mode")

  nmap_leader("ti", function()
    if Snacks.indent.enabled then
      Snacks.indent.disable()
    else
      Snacks.indent.enable()
    end
  end, "Indent guides")
end)
