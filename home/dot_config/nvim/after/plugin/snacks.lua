local snacks_ok, snacks = pcall(require, "snacks")

if snacks_ok then
  snacks.setup({
    -- Deal with big files
    bigfile = { enabled = true },

    -- File explorer
    explorer = { enabled = true },

    -- Open the current file, branch, commit, or repo in a browser
    gitbrowse = { enabled = true },

    -- Image viewer using Kitty Graphics Protocol
    image = { enabled = true },

    -- Indent guides and scopes
    indent = {
      indent = {
        enabled = true,
      },
      animate = {
        enabled = false,
      },
    },

    -- Enhanced `vim.ui.input`
    input = {
      enabled = true,
    },

    -- Enhanced `vim.notify`
    notifier = { enabled = true },

    -- Fuzzy picker for selecting items from sources
    picker = { enabled = true },

    -- Render files as quickly as possible
    quickfile = { enabled = true },

    -- Enhanced statuscolumn
    statuscolumn = {
      left = { "git", "sign" },
      right = { "fold", "mark" },
    },

    -- Distraction-free editing
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
end
