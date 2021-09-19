vim.g.startify_files_number        = 5
-- vim.g.startify_skiplist            = {"~/.local/share/nvim/site/pack/*"}
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

ngs.nnoremap("<Leader>bh", "<Cmd>Startify<CR>")
