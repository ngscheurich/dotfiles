local M = {}

local conds = require("heirline.conditions")
local util = require("ngs.util")

local theme = vim.g.ngs.theme
local pal = theme.palette or {}
local colors = theme.statusline or {}

colors = vim.tbl_extend("keep", colors, {
  fg = pal.base05,
  fg_alt = pal.base04,
  bg = pal.base01,
  bg_alt = pal.base02,

  mode_name_fg = pal.base00,
  mode_icon_fg = pal.base00,
  mode_normal = pal.base0D,
  mode_visual = pal.base0E,
  mode_select = pal.base0E,
  mode_insert = pal.base0B,
  mode_replace = pal.base08,
  mode_command = pal.base0A,
  mode_ex = pal.baseOA,
  mode_wait = pal.base09,
  mode_terminal = pal.base0F,

  readonly = pal.base08,

  vcs_branch = pal.base0E,
  vcs_added = pal.base0B,
  vcs_removed = pal.base08,
  vcs_changed = pal.base0D,

  diag_error = pal.base04,
  diag_warning = pal.base0A,
  diag_info = pal.base0D,
  diag_hint = pal.base0C,

  lsp = pal.base0F,
})

local function get_mode_opts(mode)
  local mode_opts = {
    {
      modes = { "n", "niI", "niR", "niV", "nt", "nT" },
      name = "NORMAL",
      color = colors.mode_normal,
      icon = "",
    },
    {
      modes = { "no", "nov", "noV", "no\22" },
      name = "NORMAL",
      color = colors.mode_normal,
      icon = "󱦟",
    },
    {
      modes = { "v", "vs", "V", "Vs" },
      name = "VISUAL",
      color = colors.mode_visual,
      icon = "󰒅",
    },
    { modes = { "\22", "\22s" }, name = "VISUAL", color = colors.mode_visual, icon = "󰩬" },
    { modes = { "s", "S", "\19" }, name = "SELECT", color = colors.mode_visual, icon = "󰫙" },
    { modes = { "i", "ic", "ix" }, name = "INSERT", color = colors.mode_insert, icon = "" },
    {
      modes = { "R", "Rc", "Rx", "Rv", "Rvc", "Rvx" },
      name = "REPLACE",
      color = colors.mode_replace,
      icon = "",
    },
    { modes = { "c" }, name = "COMMAND", color = colors.mode_command, icon = "" },
    { modes = { "cv" }, name = "EX", color = colors.mode_ex, icon = "" },
    { modes = { "r", "rm", "r?", "!" }, name = "...", color = colors.mode_wait, icon = "󰆅" },
    { modes = { "t" }, name = "TERMINAL", color = colors.mode_terminal, icon = "" },
  }

  for _, opts in ipairs(mode_opts) do
    for _, m in ipairs(opts.modes) do
      if m == mode then
        return opts
      end
    end
  end
end

local function mode_init(self)
  self.mode = vim.fn.mode(1)
end

local mode_update = {
  "ModeChanged",
  pattern = "*:*",
  callback = vim.schedule_wrap(function()
    vim.cmd.redrawstatus()
  end),
}

local function split_path(name)
  local last_slash = string.match(name, ".*/()")
  if last_slash then
    return string.sub(name, 1, last_slash - 1), string.sub(name, last_slash)
  else
    return "", name
  end
end

local function file_path_provider(self)
  local name = vim.fn.fnamemodify(self.filename, ":.")
  local path = split_path(name)

  if not conds.width_percent_below(#path, 0.2) then
    return vim.fn.pathshorten(path)
  else
    return path
  end
end

local function file_name_provider(self)
  local name = vim.fn.fnamemodify(self.filename, ":t")
  if name == "" then
    return "[No Name]"
  else
    return name
  end
end

local function git_diff_provider(self, type, symbol)
  local count = 0

  if self.status[type] then
    count = self.status[type]
  end

  if count > 0 then
    return symbol .. count
  end
end

local function lsp_provider(self)
  local clients = {}

  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    local hidden = false
    for _, name in ipairs(self.hidden) do
      if name == client.name then
        hidden = true
      end
    end
    if not hidden then
      table.insert(clients, client.name)
    end
  end

  if #clients > 0 then
    return "  " .. table.concat(clients, " | ")
  end
end

local function get_diagnostic_sign(severity)
  return vim.diagnostic.config().signs.text[severity]
end

local function get_diagnostic_count(severity)
  return #vim.diagnostic.get(0, { severity = severity })
end

local function darken(hex_color, amount)
  local r, g, b = hex_color:match("#(%x%x)(%x%x)(%x%x)")
  r, g, b = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)

  local factor = 1.0 - amount
  r = math.floor(r * factor)
  g = math.floor(g * factor)
  b = math.floor(b * factor)

  return string.format("#%02x%02x%02x", r, g, b)
end

M.mode_bar = {
  init = mode_init,
  update = mode_update,
  {
    provider = function(self)
      return string.format(" %s  ", get_mode_opts(self.mode).icon)
    end,
    hl = function(self)
      return {
        fg = colors.mode_icon_fg,
        bg = darken(get_mode_opts(self.mode).color, 0.2),
        bold = true,
      }
    end,
  },
  {
    provider = function(self)
      return string.format(" %s ", get_mode_opts(self.mode).name)
    end,
    hl = function(self)
      return {
        fg = colors.mode_name_fg,
        bg = get_mode_opts(self.mode).color,
        bold = true,
      }
    end,
  },
}

M.mode_tag = {
  init = mode_init,
  update = mode_update,
  provider = function()
    return " "
  end,
  hl = function(self)
    return {
      bg = get_mode_opts(self.mode).color,
    }
  end,
}

M.file = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  {
    provider = file_path_provider,
    hl = { fg = colors.fg_alt },
  },
  {
    provider = file_name_provider,
    hl = function()
      return vim.bo.modified and { fg = colors.fg }
    end,
  },
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "",
    hl = { fg = colors.vcs_changed },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = " ",
    hl = { fg = colors.readonly },
  },
}

M.git = function()
  local ok, _ = pcall(require, "gitsigns")

  return {
    condition = function()
      return ok and conds.is_git_repo()
    end,
    init = function(self)
      self.status = vim.b.gitsigns_status_dict
    end,
    {
      provider = function(self)
        return string.format(" %s ", self.status.head)
      end,
      hl = { fg = colors.vcs_branch },
    },
    {
      provider = function(self)
        return git_diff_provider(self, "added", "+")
      end,
      hl = { fg = colors.vcs_added },
    },
    {
      provider = function(self)
        return git_diff_provider(self, "removed", "-")
      end,
      hl = { fg = colors.vcs_removed },
    },
    {
      provider = function(self)
        return git_diff_provider(self, "changed", "~")
      end,
      hl = { fg = colors.vcs_changed },
    },
  }
end

M.diagnostics = {
  condition = conds.has_diagnostics,
  static = {
    icons = {
      error = get_diagnostic_sign("vim.diagnostic.severity.ERROR"),
      warn = get_diagnostic_sign("vim.diagnostic.severity.WARN"),
      info = get_diagnostic_sign("vim.diagnostic.severity.INFO"),
      hint = get_diagnostic_sign("vim.diagnostic.severity.HINT"),
    },
  },
  init = function(self)
    self.errors = get_diagnostic_count("ERROR")
    self.warns = get_diagnostic_count("WARN")
    self.infos = get_diagnostic_count("INFO")
    self.hints = get_diagnostic_count("HINT")
  end,
  update = { "DiagnosticChanged", "BufEnter" },
  {
    provider = function(self)
      return self.errors > 0 and string.format(" %s %i", self.icons.error, self.errors)
    end,
    hl = { fg = colors.diag_error },
  },
  {
    provider = function(self)
      return self.warns > 0 and string.format(" %s %i", self.icons.warn, self.warns)
    end,
    hl = { fg = colors.diag_warning },
  },
  {
    provider = function(self)
      return self.infos > 0 and string.format(" %s %i", self.icons.info, self.infos)
    end,
    hl = { fg = colors.diag_info },
  },
  {
    provider = function(self)
      return self.hints > 0 and string.format(" %s %i", self.icons.hint, self.hints)
    end,
    hl = { fg = colors.diag_hint },
  },
}

M.lsp = {
  condition = conds.lsp_attached,
  update = { "LspAttach", "LspDetach" },
  static = { hidden = { "GitHub Copilot" } },
  provider = lsp_provider,
  hl = { fg = colors.lsp },
}

M.filetype = function()
  local ok, _ = pcall(require, "mini.icons")

  if ok then
    return {
      condition = function()
        return ok
      end,
      init = function(self)
        local icon, hl_group = MiniIcons.get("filetype", vim.bo.filetype)
        self.icon = icon
        self.hl_group = hl_group
        self.ft = vim.bo.filetype
      end,
      {
        provider = function(self)
          return self.icon
        end,
        hl = function(self)
          return { fg = util.get_hl_attr(self.hl_group, "fg") }
        end,
      },
      {
        provider = function(self)
          return " " .. self.ft
        end,
        hl = { fg = colors.fg_alt },
      },
    }
  else
    return {
      provider = function()
        return vim.bo.filetype
      end,
    }
  end
end

M.ruler = {
  provider = " %7(%l/%3L%):%2c %P ",
  hl = { fg = colors.fg, bg = colors.bg_alt },
}

M.span = {
  provider = "%=",
  hl = { bg = colors.bg },
}

M.gap = function(width)
  return {
    provider = function()
      local gap = ""
      for _ = 1, width or 1 do
        gap = gap .. " "
      end
      return gap
    end,
  }
end

return M
