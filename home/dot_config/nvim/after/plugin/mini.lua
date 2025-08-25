local add = MiniDeps.add

-- ==============================================================================
--  mini.align
-- ------------------------------------------------------------------------------
--  https://github.com/echasnovski/mini.align
--  Align text interactively
--  editing
-- ------------------------------------------------------------------------------
add({ source = "echasnovski/mini.align", checkout = "stable" })
require("mini.align").setup()

-- ==============================================================================
--  mini.bracketed
-- ------------------------------------------------------------------------------
--  https://github.com/echasnovski/mini.bracketed
--  Move back and forth between locations
--  workflow
-- ------------------------------------------------------------------------------
add({ source = "echasnovski/mini.bracketed", checkout = "stable" })
require("mini.bracketed").setup()

-- ==============================================================================
--  mini.icons
-- ------------------------------------------------------------------------------
--  https://github.com/echasnovski/mini.icons
--  Icon provider
--  ui
-- ------------------------------------------------------------------------------
add({ source = "echasnovski/mini.icons", checkout = "stable" })
require("mini.icons").setup()

-- ==============================================================================
--  mini.pairs
-- ------------------------------------------------------------------------------
--  https://github.com/echasnovski/mini.pairs
--  Automatically inserts the other half of a character pair
--  editing
-- ------------------------------------------------------------------------------
add({ source = "echasnovski/mini.pairs", checkout = "stable" })
require("mini.pairs").setup()

-- ==============================================================================
--  mini.surround
-- ------------------------------------------------------------------------------
--  https://github.com/echasnovski/mini.surround
--  Actions for operating on surrounding pairs
--  editing
-- ------------------------------------------------------------------------------
add({ source = "echasnovski/mini.surround", checkout = "stable" })
require("mini.surround").setup({
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
})

-- ==============================================================================
--  mini.base16
-- ------------------------------------------------------------------------------
--  https://github.com/echasnovski/mini.base16
--  Theme implementing the Base16 spec
--  ui
-- ------------------------------------------------------------------------------
add({ source = "echasnovski/mini.base16", checkout = "stable" })
vim.g.ngs.theme.apply(require("mini.base16").setup)
