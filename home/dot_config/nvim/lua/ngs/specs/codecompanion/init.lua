return {
  -- ===================================================================
  --  CodeCompanion
  -- -------------------------------------------------------------------
  --  https://codecompanion.olimorris.dev/
  --  Seamless, AI-powered coding
  --  generative-ai
  -- -------------------------------------------------------------------
  {
    "olimorris/codecompanion.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",

      -- ===================================================================
      --  MCP Hub
      -- -------------------------------------------------------------------
      --  https://github.com/ravitemer/mcphub.nvim
      --  Model Context Protocol client
      --  generative-ai
      -- -------------------------------------------------------------------
      {
        "ravitemer/mcphub.nvim",
        build = "npm install -g mcp-hub@latest",
        opts = {},
        keys = {
          { "<Leader>am", "<Cmd>MCPHub<CR>", desc = "MCPHub" },
        },
      },
    },

    opts = {
      strategies = {
        chat = {
          adapter = {
            name = "copilot",
            model = "claude-sonnet-4",
          },
        },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            show_result_in_chat = true, -- Show mcp tool results in chat
            make_vars = true, -- Convert resources to #variables
            make_slash_commands = true, -- Add prompts as /slash commands
          },
        },
      },
      display = {
        chat = {
          diff = {
            provider = "mini_diff",
          },
          window = {
            width = 0.3,
            opts = {
              number = false,
              winhighlight = "Normal:NormalDark",
            },
          },
        },
      },
    },

    init = function()
      require("ngs.specs.codecompanion.fidget"):init()
    end,

    cmd = "CodeCompanion",

    keys = {
      { "<Leader>aa", "<Cmd>CodeCompanionActions<CR>", desc = "Actions", mode = { "n", "v" } },
      { "<Leader>ac", "<Cmd>CodeCompanion chat<CR>", desc = "Chat", mode = { "n", "v" } },
      { "<Leader>ae", "<Cmd>CodeCompanion /explain<CR>", desc = "Explain", mode = { "n", "v" } },
      { "<Leader>af", "<Cmd>CodeCompanion /fix<CR>", desc = "Fix", mode = { "n", "v" } },
      { "<Leader>ag", "<Cmd>CodeCompanion /commit<CR>", desc = "Write commit message" },
      { "<Leader>al", "<Cmd>CodeCompanion /lsp<CR>", desc = "LSP Explain", mode = { "n", "v" } },
      { "<Leader>at", "<Cmd>CodeCompanion /tests<CR>", desc = "Write tests", mode = { "n", "v" } },
    },
  },
}
