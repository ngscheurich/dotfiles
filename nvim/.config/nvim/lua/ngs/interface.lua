require("nvim-web-devicons").setup({
  override = {
    dirvish  = {icon = ""},
    zsh      = {icon = ""},
    quickfix = {icon = ""},
    erlang   = {color = "#A1022B"},
    NvimTree = {icon = ""},
    text     = {icon = ""},
  },
})

require("gitsigns").setup({
  signs = {
    add          = {text = '┃'},
    change       = {text = '┃'},
    delete       = {text = '┃'},
    topdelete    = {text = '┃'},
    changedelete = {text = '┃'},
  },
  keymaps = {},
})

require("lspkind").init({
  symbol_map = {
    Constant = "π",
    Function = "",
  },
})

vim.g.indent_blankline_enabled = false
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_char = "│"

require("trouble").setup()

vim.g.startify_files_number        = 5
vim.g.startify_bookmarks           = {}
vim.g.startify_session_persistence = 1

local v = vim.version()
local version = table.concat({v.major, v.minor, v.patch}, ".")

local header = {
    [[                                  __                      ]],
    [[     ___      __    ___   __  __ /\_\    ___ ___          ]],
    [[   /' _ `\  /'__`\ / __`\/\ \/\ \\/\ \ /' __` __`\        ]],
    [[   /\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \       ]],
    [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\      ]],
    [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/      ]],
    [[                                                          ]],
    [[        Welcome to NVIM v]] .. version .. [[.  Happy hacking. ]],
    [[                                                          ]],
    [[   ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░      ]]
}

vim.g.startify_custom_header = header

require("colorizer").setup()
