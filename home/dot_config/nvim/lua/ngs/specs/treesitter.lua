return {
  -- ===================================================================
  --  nvim-treesitter
  -- -------------------------------------------------------------------
  --  https://github.com/nvim-treesitter/nvim-treesitter
  --  Tree-sitter configurations and abstraction layer
  --  tree-sitter
  -- -------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",

    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "css",
        "elixir",
        "erlang",
        "fennel",
        "gdscript",
        "go",
        "graphql",
        "heex",
        "html",
        "http",
        "javascript",
        "json",
        "kdl",
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "rust",
        "scss",
        "sql",
        "svelte",
        "typescript",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
  },

  -- ===================================================================
  --  nvim-treesitter-textobjects
  -- -------------------------------------------------------------------
  --  https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  --  Syntax-aware text-objects and movements
  --  tree-sitter
  -- -------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },

    opts = {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "outer function" },
            ["if"] = { query = "@function.inner", desc = "inner function" },
            ["ac"] = { query = "@class.outer", desc = "outer class" },
            ["ic"] = { query = "@class.inner", desc = "inner class" },
            ["is"] = { query = "@local.scope", query_group = "locals", desc = "inner scope" },
            ["as"] = { query = "@local.scope", query_group = "locals", desc = "outer scope" },
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ["<LocalLeader>p"] = { query = "@parameter.inner", desc = "Swap next parameter" },
          },
          swap_previous = {
            ["<LocalLeader>P"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
          },
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = { query = "@function.outer", desc = "Next function start" },
            ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope start" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]M"] = { query = "@function.outer", desc = "Next function end" },
            ["]S"] = { query = "@local.scope", query_group = "locals", desc = "Next scope end" },
          },
          goto_previous_start = {
            ["[m"] = { query = "@function.outer", desc = "Previous function start" },
            ["[s"] = {
              query = "@local.scope",
              query_group = "locals",
              desc = "Previous scope start",
            },
            ["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
          },
          goto_previous_end = {
            ["]M"] = { query = "@function.outer", desc = "Previous function end" },
            ["[S"] = { query = "@local.scope", query_group = "locals", desc = "Previous scope end" },
          },
        },
      },
    },

    config = function(_, opts)
      local ts_configs = require("nvim-treesitter.configs")
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

      ts_configs.setup(opts)

      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
    end,
  },
}
