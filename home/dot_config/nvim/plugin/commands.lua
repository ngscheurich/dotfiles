-- =============================================================================
--   User Commands
-- -----------------------------------------------------------------------------
local command = vim.api.nvim_create_user_command

command("LspInfo", ":checkhealth vim.lsp", { desc = "Alias to `:checkhealth vim.lsp`" })

command("LspStop", function()
  vim.lsp.stop_client(vim.lsp.get_clients())
end, { desc = "Stop all active LSP clients" })

command("LspRestart", function()
  vim.lsp.stop_client(vim.lsp.get_clients())
  vim.cmd.edit()
end, { desc = "Restart LSP clients for the current buffer" })

command("Theme", function(opts)
  local theme = opts.args
  vim.system({ "grim", "theme", "--", theme }):wait()
  require("ngs.util").reload_theme()
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
