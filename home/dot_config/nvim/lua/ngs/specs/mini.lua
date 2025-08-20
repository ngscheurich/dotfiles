return {
  -- ==============================================================================
  --  mini.align
  -- ------------------------------------------------------------------------------
  --  https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-align.md
  --  Align text interactively
  --  editing
  -- ------------------------------------------------------------------------------
  { "echasnovski/mini.align", version = "*", event = "VeryLazy", opts = {} },

  -- ==============================================================================
  --  mini.bracketed
  -- ------------------------------------------------------------------------------
  --  https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-bracketed.md
  --  Move back and forth between locations
  --  workflow
  -- ------------------------------------------------------------------------------
  { "echasnovski/mini.bracketed", version = "*", event = "VeryLazy", opts = {} },

  -- ==============================================================================
  --  mini.diff
  -- ------------------------------------------------------------------------------
  --  https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-diff.md
  --  Work with diff hunks
  --  source-control
  -- ------------------------------------------------------------------------------
  { "echasnovski/mini.diff", version = "*", event = "VeryLazy", opts = {} },

  -- ==============================================================================
  --  mini.pairs
  -- ------------------------------------------------------------------------------
  --  https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md
  --  Automatically inserts the other half of a character pair
  --  editing
  -- ------------------------------------------------------------------------------
  { "echasnovski/mini.pairs", version = "*", event = "VeryLazy", opts = {} },

  -- ==============================================================================
  --  mini.surround
  -- ------------------------------------------------------------------------------
  --  https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md
  --  Actions for operating on surrounding pairs
  --  editing
  -- ------------------------------------------------------------------------------
  {
    "echasnovski/mini.surround",
    version = "*",
    event = "VeryLazy",

    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
        suffix_last = "l",
        suffix_next = "n",
      },
    },
  },

  -- ==============================================================================
  --  mini.base16
  -- ------------------------------------------------------------------------------
  --  https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-base16.md
  --  Theme implementing the Base16 spec
  --  ui
  -- ------------------------------------------------------------------------------
  {
    "echasnovski/mini.base16",
    version = "*",
    priority = 1000,

    config = function()
      vim.g.ngs.theme.apply(require("mini.base16").setup)
    end,
  },
}
