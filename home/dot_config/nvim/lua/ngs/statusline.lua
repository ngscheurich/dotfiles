local conds = require("heirline.conditions")
local util = require("ngs.util")
local palette = require("nightfox.palette").load("nightfox")

local theme = vim.g.ngs.theme
local colors = theme.statusline or {}

colors = vim.tbl_extend("keep", colors, {
  fg = palette.fg1,
  fg_alt = palette.fg2,
  bg = palette.bg0,
  bg_alt = palette.bg2,

  mode_name_fg = palette.bg0,
  mode_icon_fg = palette.bg0,
  mode_normal = palette.blue.base,
  mode_visual = palette.magenta.base,
  mode_select = palette.pink.base,
  mode_insert = palette.green.base,
  mode_replace = palette.red.base,
  mode_command = palette.yellow.base,
  mode_ex = palette.yellow.base,
  mode_wait = palette.orange.base,
  mode_terminal = palette.black.base,

  readonly = palette.red.base,

  vcs_branch = palette.magenta.base,
  vcs_added = palette.green.base,
  vcs_removed = palette.red.base,
  vcs_changed = palette.blue.base,

  diag_error = palette.red.base,
  diag_warning = palette.yellow.base,
  diag_info = palette.blue.base,
  diag_hint = palette.cyan.base,

  lsp = palette.blue.base,
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
    return " " .. table.concat(clients, " ")
  end
end

local function get_diagnostic_sign(severity)
  return vim.diagnostic.config().signs.text[severity]
end

local function get_diagnostic_count(severity)
  return #vim.diagnostic.get(0, { severity = severity })
end

local mode_bar = {
  init = mode_init,
  update = mode_update,
  {
    provider = function(self)
      return string.format(" %s  ", get_mode_opts(self.mode).icon)
    end,
    hl = function(self)
      return {
        fg = colors.mode_icon_fg,
        bg = colors.mode_icon_bg or util.shade(get_mode_opts(self.mode).color, -0.2),
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

local mode_tag = {
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

local file = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  {
    provider = file_path_provider,
    hl = { fg = colors.fg_alt, bg = colors.bg },
  },
  {
    provider = file_name_provider,
    hl = { fg = colors.fg, bg = colors.bg },
  },
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "",
    hl = { fg = colors.vcs_changed, bg = colors.bg },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = " ",
    hl = { fg = colors.readonly, bg = colors.bg },
  },
}

local git = function()
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
      hl = { fg = colors.vcs_branch, bg = colors.bg },
    },
    {
      provider = function(self)
        return git_diff_provider(self, "added", "+")
      end,
      hl = { fg = colors.vcs_added, bg = colors.bg },
    },
    {
      provider = function(self)
        return git_diff_provider(self, "removed", "-")
      end,
      hl = { fg = colors.vcs_removed, bg = colors.bg },
    },
    {
      provider = function(self)
        return git_diff_provider(self, "changed", "~")
      end,
      hl = { fg = colors.vcs_changed, bg = colors.bg },
    },
  }
end

local diagnostics = {
  condition = conds.has_diagnostics,
  static = {
    icons = {
      error = get_diagnostic_sign(vim.diagnostic.severity.ERROR),
      warn = get_diagnostic_sign(vim.diagnostic.severity.WARN),
      info = get_diagnostic_sign(vim.diagnostic.severity.INFO),
      hint = get_diagnostic_sign(vim.diagnostic.severity.HINT),
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
    hl = { fg = colors.diag_error, bg = colors.bg },
  },
  {
    provider = function(self)
      return self.warns > 0 and string.format(" %s %i", self.icons.warn, self.warns)
    end,
    hl = { fg = colors.diag_warning, bg = colors.bg },
  },
  {
    provider = function(self)
      return self.infos > 0 and string.format(" %s %i", self.icons.info, self.infos)
    end,
    hl = { fg = colors.diag_info, bg = colors.bg },
  },
  {
    provider = function(self)
      return self.hints > 0 and string.format(" %s %i", self.icons.hint, self.hints)
    end,
    hl = { fg = colors.diag_hint, bg = colors.bg },
  },
}

local lsp = {
  condition = conds.lsp_attached,
  update = { "LspAttach", "LspDetach" },
  static = { hidden = { "copilot" } },
  provider = lsp_provider,
  hl = { fg = colors.lsp, bg = colors.bg },
}

local filetype = function()
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
          if colors.ft_icon then
            return { fg = colors.ft_icon, bg = colors.bg }
          end
          return { fg = util.get_hl_attr(self.hl_group, "fg"), bg = colors.bg }
        end,
      },
      {
        provider = function(self)
          return " " .. self.ft
        end,
        hl = { fg = colors.fg_alt, bg = colors.bg },
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

local ruler = {
  provider = "  %7(%l/%3L%):%2c %P ",
  hl = { fg = colors.fg, bg = colors.bg_alt },
}

local span = {
  provider = "%=",
  hl = { bg = colors.bg },
}

local function gap(width)
  return {
    provider = function()
      local g = ""
      for _ = 1, width or 1 do
        g = g .. " "
      end
      return g
    end,
    hl = { bg = colors.bg },
  }
end

return {
  build = function()
    require("heirline").setup({
      statusline = {
        mode_bar,
        gap(2),
        file,
        gap(2),
        git(),
        span,
        diagnostics,
        gap(2),
        lsp,
        gap(2),
        filetype(),
        gap(2),
        ruler,
        -- mode_tag,
      },
    })
  end,
}
