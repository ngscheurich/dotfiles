local devicons = require("nvim-web-devicons")
local colors = ngs.theme.statusline
local get_mode_color = require("feline.providers.vi_mode").get_mode_color
local lsp = require("feline.providers.lsp")

require("plugins.feline.providers")

local function mode_hl()
  return {
    fg = colors.bg,
    bg = get_mode_color(),
  }
end

local M = {}

M.mode = {
  provider = "vi_mode",
  icon = "",
  hl = mode_hl,
  left_sep = {str = " ", hl = mode_hl},
  right_sep = { str = " ", hl = mode_hl},
}

M.file = {
  info = {
    provider = "file_info",
    type = "unique",
    hl = {
      bg = colors.bg_bright,
    },
    left_sep = {
      str = " ",
      hl = {bg = colors.bg_bright},
    },
    icon = function ()
      local filename = vim.fn.expand("%:t")
      local extension = vim.fn.expand("%:e")
      local str, grp = devicons.get_icon(filename, extension, {default = true})
      return {
        str = str .. " ",
        hl = {
          fg = ngs.util.get_highlight_attr(grp, "fg"),
          bg = colors.bg_bright,
        },
      }
    end,
    -- file_readonly_icon = "",
  },
  info_inactive = {
    provider = "file_info",
    type = "unique",
    hl = {bg = colors.bg, fg = colors.fg_dim},
    left_sep = " ",
    icon = function ()
      local filename = vim.fn.expand("%:t")
      local extension = vim.fn.expand("%:e")
      local str = devicons.get_icon(filename, extension, {default = true})
      return { str = str .. " "}
    end,
  },
  type = {provider = "ngs_file_type", right_sep = " "}
}

M.position = {
  cursor = {
    provider = "ngs_cursor_position",
    hl = mode_hl,
    left_sep = {str = " ", hl = mode_hl},
    right_sep = {str = " ", hl = mode_hl},
  },
  byte   = {
    provider = "ngs_byte_percent",
    hl = mode_hl,
    left_sep = {str = " ", hl = mode_hl},
    right_sep = {str = " ☰ ", mode_hl},
  },
}

M.diagnostics = {
  errors = {
    provider = "diagnostic_errors",
    hl = {fg = colors.diagnostics.errors},
    icon = "  ",
    right_sep = " ",
    enabled = function() return lsp.diagnostics_exist("Error") end,
  },
  warnings = {
    provider = "diagnostic_warnings",
    hl = {fg = colors.diagnostics.warnings},
    icon = " ",
    right_sep = " ",
    enabled = function() return lsp.diagnostics_exist("Warning") end,
  },
  hints = {
    provider = "diagnostic_hints",
    hl = {fg = colors.diagnostics.hints},
    icon = " ",
    right_sep = " ",
    enabled = function() return lsp.diagnostics_exist("Hint") end,
  },
  info     = {
    provider = "diagnostic_info",
    hl = {fg = colors.diagnostics.info},
    icon = " ",
    right_sep = " ",
    enabled = function() return lsp.diagnostics_exist("Info") end,
  },
}

M.git = {
  branch = {
    provider = "ngs_git_branch",
    icon = {
      str = "  ",
      hl = {fg = colors.git.icon},
    },
    left_sep = " ",
    right_sep = " ",
  },
  added = {
    provider = "git_diff_added",
    icon = "+",
    hl = {fg = colors.git.added},
    right_sep = " ",
  },
  changed = {
    provider = "git_diff_changed",
    icon = "~",
    hl = {fg = colors.git.changed},
    right_sep = " ",
  },
  removed = {
    provider = "git_diff_removed",
    icon = "-",
    hl = {fg = colors.git.removed},
    right_sep = " ",
  },
}

return M
