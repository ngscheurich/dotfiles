return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    -- ===================================================================
    --  bigfile (snacks.nvim)
    -- -------------------------------------------------------------------
    --  https://github.com/folke/snacks.nvim/blob/main/docs/bigfile.md
    --  Deal with big files
    --  misc
    -- -------------------------------------------------------------------
    bigfile = { enabled = true },

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
  },

  keys = {
    -- stylua: ignore start
    -- Picker Quick
    { "<C-f>", function () Snacks.picker.files({layout = "ivy"}) end, desc = "Files" },
    { "<C-g>", function () Snacks.picker.grep({layout = "ivy"}) end, desc = "Grep" },
    { "<C-_>", function () Snacks.picker.lines() end, desc = "Lines" },
    { "<C-Space>", function () Snacks.picker.buffers({layout = "select"}) end, desc = "Buffers" },

    -- Picker General
    { "<Leader><Leader>", function() Snacks.picker.smart({layout = "ivy"}) end, desc = "Find files (smart)" },
    { "<Leader>r", function() Snacks.picker.resume() end, desc = "Resume picker" },

    -- Picker Find
    { "<Leader>ff", function() Snacks.picker.files() end, desc = "Files" },
    { "<Leader>fg", function() Snacks.picker.git_files() end, desc = "Git files" },
    { "<Leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<Leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },

    -- Picker Search
    { "<Leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocommands" },
    { "<Leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep buffers" },
    { "<Leader>s:", function() Snacks.picker.command_history() end, desc = "Command history" },
    { "<Leader>sc", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<Leader>sD", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<Leader>sd", function() Snacks.picker.diagnostics_buffer() end, desc = "Diagnostics (buffer)" },
    { "<Leader>sh", function() Snacks.picker.help() end, desc = "Help pages" },
    { "<Leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<Leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<Leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<Leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<Leader>sl", function() Snacks.picker.loclist() end, desc = "Location list" },
    { "<Leader>sM", function() Snacks.picker.man() end, desc = "Man pages" },
    { "<Leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<Leader>sn", function() Snacks.picker.notifications() end, desc = "Notification history" },
    { "<Leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix list" },
    { "<Leader>s\"", function() Snacks.picker.registers() end, desc = "Registers" },
    { "<Leader>s/", function() Snacks.picker.search_history() end, desc = "Search history" },
    { "<Leader>su", function() Snacks.picker.undo() end, desc = "Undo history" },
    { "<Leader>sw", function() Snacks.picker.grep_word() end, desc = "Words" },

    -- Picker Replacements
    { "grr", function() Snacks.picker.lsp_references() end, desc = "References" },

    -- Miscellaneous
  	{ "<Leader>gB", function() Snacks.gitbrowse() end, desc = "View on GitHub", },

  	{
  		"<Leader>ui",
  		function()
  			if Snacks.indent.enabled then
  				Snacks.indent.disable()
  			else
  				Snacks.indent.enable()
  			end
  		end,
  		desc = "Indent Guides",
  	},
    -- stylua: ignore end
  },
}
