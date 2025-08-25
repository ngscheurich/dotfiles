MiniDeps.add("folke/snacks.nvim")

require("snacks").setup({
  -- ===================================================================
  --  bigfile (snacks.nvim)
  -- -------------------------------------------------------------------
  --  https://github.com/folke/snacks.nvim/blob/main/docs/bigfile.md
  --  Deal with big files
  --  misc
  -- -------------------------------------------------------------------
  bigfile = { enabled = true },

  -- ===================================================================
  --  bigfile (snacks.nvim)
  -- -------------------------------------------------------------------
  --  https://github.com/folke/snacks.nvim/blob/main/docs/bigfile.md
  --  Deal with big files
  --  misc
  -- -------------------------------------------------------------------
  explorer = { enabled = true },

  -- ===================================================================
  --  gitbrowse (snacks.nvim)
  -- -------------------------------------------------------------------
  --  https://github.com/folke/snacks.nvim/blob/main/docs/gitbrowse.md
  --  Open the current file, branch, commit, or repo in a browser
  --  source-control
  -- -------------------------------------------------------------------
  gitbrowse = { enabled = true },

  -- ===================================================================
  --  image (snacks.nvim)
  -- -------------------------------------------------------------------
  --  https://github.com/folke/snacks.nvim/blob/main/docs/image.md
  --  Image viewer using Kitty Graphics Protocol
  --  misc
  -- -------------------------------------------------------------------
  image = { enabled = true },

  -- ===================================================================
  --  indent (snacks.nvim)
  -- -------------------------------------------------------------------
  --  https://github.com/folke/snacks.nvim/blob/main/docs/indent.md
  --  Indent guides and scopes
  --  ui
  -- -------------------------------------------------------------------
  indent = {
    enabled = false,
    char = ";",
    only_scope = true,
    only_current = true,
    hl = "Statement",
  },

  -- ===================================================================
  --  notifier (snacks.nvim)
  -- -------------------------------------------------------------------
  --  https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md
  --  Enhanced `vim.notify`
  --  ui
  -- -------------------------------------------------------------------
  notifier = { enabled = true },

  -- ===================================================================
  --  picker (snacks.nvim)
  -- -------------------------------------------------------------------
  --  https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
  --  Fuzzy picker for selecting items from sources
  --  workflow
  -- -------------------------------------------------------------------
  picker = { enabled = true },

  -- ===================================================================
  --  quickfile (snacks.nvim)
  -- -------------------------------------------------------------------
  --  https://github.com/folke/snacks.nvim/blob/main/docs/quickfile.md
  --  Render files as quickly as possible
  --  misc
  -- -------------------------------------------------------------------
  quickfile = { enabled = true },

  -- ===================================================================
  --  statuscolumn (snacks.nvim)
  -- -------------------------------------------------------------------
  --  https://github.com/folke/snacks.nvim/blob/main/docs/statuscolumn.md
  --  Enhanced statuscolumn
  --  ui
  -- -------------------------------------------------------------------
  statuscolumn = { enabled = true },

  -- ===================================================================
  --  zen (snacks.nvim)
  -- -------------------------------------------------------------------
  --  https://github.com/folke/snacks.nvim/blob/main/docs/zen.md
  --  Distraction-free editing
  --  ui
  -- -------------------------------------------------------------------
  zen = {
    enabled = true,
    toggles = {
      dim = false,
      line_number = false,
    },
    on_open = function()
      vim.cmd("PencilSoft")
    end,
    win = {
      backdrop = { transparent = false },
    },
  },
})

local function pick(lhs, func, opts)
  local layout = opts.layout
  opts.layout = nil
  vim.keymap.set("n", lhs, function()
    Snacks.picker[func]({ layout = layout })
  end, opts)
end

-- Picker Quick
pick("<C-f>", "files", { layout = "ivy", desc = "Files" })
pick("<C-g>", "grep", { layout = "ivy", desc = "Grep" })
pick("<C-_>", "lines", { desc = "Lines" })
pick("<C-Space>", "buffers", { layout = "select", desc = "Buffers" })

-- Picker General
pick("<Leader><Leader>", "smart", { layout = "ivy", desc = "Smart files" })
pick("<Leader>r", "resume", { desc = "Resume picker" })

-- Picker Find
pick("<Leader>ff", "files", { desc = "Files" })
pick("<Leader>fg", "git_files", { desc = "Git files" })
pick("<Leader>fp", "projects", { desc = "Projects" })
pick("<Leader>fr", "recent", { desc = "Recent files" })

-- Picker Search
pick("<Leader>sa", "autocmds", { desc = "Autocommands" })
pick("<Leader>sB", "grep_buffers", { desc = "Grep buffers" })
pick("<Leader>s:", "command_history", { desc = "Command history" })
pick("<Leader>sc", "commands", { desc = "Commands" })
pick("<Leader>sD", "diagnostics", { desc = "Diagnostics" })
pick("<Leader>sd", "diagnostics_buffer", { desc = "Diagnostics (buffer)" })
pick("<Leader>sh", "help", { desc = "Help pages" })
pick("<Leader>sH", "highlights", { desc = "Highlights" })
pick("<Leader>si", "icons", { desc = "Icons" })
pick("<Leader>sj", "jumps", { desc = "Jumps" })
pick("<Leader>sk", "keymaps", { desc = "Keymaps" })
pick("<Leader>sl", "loclist", { desc = "Location list" })
pick("<Leader>sM", "man", { desc = "Man pages" })
pick("<Leader>sm", "marks", { desc = "Marks" })
pick("<Leader>sn", "notifications", { desc = "Notification history" })
pick("<Leader>sq", "qflist", { desc = "Quickfix list" })
pick("<Leader>s\\", "registers", { desc = "Registers" })
pick("<Leader>s/", "search_history", { desc = "Search history" })
pick("<Leader>su", "undo", { desc = "Undo history" })
pick("<Leader>sw", "grep_word", { desc = "Words" })

-- Picker Replacements
pick("grr", "lsp_references", { desc = "References" })

-- Other
vim.keymap.set("n", "<Leader>e", function()
  Snacks.explorer.open()
end, { desc = "Explorer (toggle)" })

vim.keymap.set("n", "<Leader>gB", function()
  Snacks.gitbrowse()
end, { desc = "View on GitHub" })

vim.keymap.set("n", "<Leader>ti", function()
  if Snacks.indent.enabled then
    Snacks.indent.disable()
  else
    Snacks.indent.enable()
  end
end, { desc = "Indent Guides" })
