-- =============================================================================
--   Commands
-- -----------------------------------------------------------------------------

local autocmd = Config.autocmd
local command = vim.api.nvim_create_user_command

-- Autocommands ----------------------------------------------------------------
autocmd(
  "TermOpen",
  "*",
  function() vim.opt_local.winhighlight = "Normal:NormalAlt" end,
  "Change the background of terminal buffers"
)

-- User commands ---------------------------------------------------------------
command("Theme", function(opts)
  local theme = opts.args
  vim.system({ "grim", "theme", "--", theme }):wait()
  require("ngs.util").setup_theme()
end, {
  desc = "Change the system theme",
  nargs = 1,
  complete = function()
    local data_home = vim.env.XDG_DATA_HOME or vim.env.HOME .. "/.local/share"
    local themes_dir = data_home .. "/themes"
    local themes = {}

    local entries = vim.fn.glob(themes_dir .. "/*", false, true)
    for _, entry in ipairs(entries) do
      if vim.fn.isdirectory(entry) == 1 then
        local dirname = vim.fn.fnamemodify(entry, ":t")
        table.insert(themes, dirname)
      end
    end

    return themes
  end,
})
