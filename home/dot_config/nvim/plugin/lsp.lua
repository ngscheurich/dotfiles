-- =============================================================================
-- 󱐋 Language Server Protocol Client
-- -----------------------------------------------------------------------------

vim.lsp.config("*", {
  root_markers = { ".git" },
})

vim.lsp.config("lua_ls", {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath("config") then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
        path = { "lua/?.lua", "lua/?/init.lua" },
      },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
    })
  end,
  settings = {
    Lua = {},
  },
})

vim.lsp.enable({
  "bash_ls",
  "elixir_ls",
  "fish_lsp",
  "gleam",
  "lua_ls",
  "nil",
  "tombi",
  "typescript_ls",
  "vscode_json_ls",
})
