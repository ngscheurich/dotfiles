local devicons = require("nvim-web-devicons")
local colors = require("ngs.theme").colors

local lsp = require("feline.providers.lsp")

require("config.feline.providers")

local vi_mode_hl = function ()
  return {
    fg = require("feline.providers.vi_mode").get_mode_color(),
  }
end

local M = {}

M.mode = {
  provider = "vi_mode",
  icon = "",
  hl = vi_mode_hl,
  left_sep = {str = "❚ ", hl = vi_mode_hl},
  right_sep = { str = " "},
}

M.file = {
  info = {
    provider = "file_info",
    type = "unique",
    left_sep = " ",
    icon = function ()
      local filename = vim.fn.expand("%:t")
      local extension = vim.fn.expand("%:e")
      local str, hl= devicons.get_icon(filename, extension, {default = true})
      return {str = str .. " ", hl = hl}
    end
  },

  type = {provider = "ngs_file_type", right_sep = " "}
}

M.position = {
  cursor = {provider = "ngs_cursor_position", icon = " ", right_sep = " "},
  byte   = {provider = "ngs_byte_percent", icon = "☰ "},
}

M.diagnostics = {
  errors   = {
    provider = "diagnostic_errors",
    hl = {fg = colors.red},
    icon = " ",
    right_sep = " ",
    enabled = function()
      return lsp.diagnostics_exist("Error")
    end,
  },
  warnings = {
    provider = "diagnostic_warnings",
    hl = {fg = colors.yellow},
    icon = " ",
    right_sep = " ",
    enabled = function()
      return lsp.diagnostics_exist("Warning")
    end,
  },
  hints = {
    provider = "diagnostic_hints",
    hl = {fg = colors.cyan},
    icon = " ",
    right_sep = " ",
    enabled = function()
      return lsp.diagnostics_exist("Hint")
    end,
  },
  info     = {
    provider = "diagnostic_info",
    hl = {fg = colors.blue},
    icon = " ",
    right_sep = " ",
    enabled = function()
      return lsp.diagnostics_exist("Info")
    end,
  },
}

M.git = {
  branch = {
    provider = "ngs_git_branch",
    icon = {str = "  "},
    right_sep = " ",
  },
  added = {
    provider = "git_diff_added",
    icon = "+",
    right_sep = " ",
  },
  changed = {
    provider = "git_diff_changed",
    icon = "~",
    right_sep = " ",
  },
  removed = {
    provider = "git_diff_removed",
    icon = "-",
    right_sep = " ",
  },
}

return M
