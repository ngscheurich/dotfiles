return function(config)
  local lua_root = "/usr/local/opt/lua-language-server"
  local lua_bin = lua_root .. "/bin/macOS/lua-language-server"
  local lua_main = lua_root .. "/main.lua"

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  require("lspconfig").sumneko_lua.setup(
    vim.tbl_extend("force", config, {
      cmd = {lua_bin, "-E", lua_main},
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = runtime_path,
          },
          diagnostics = {
            globals = {"vim", "ngs"}
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            preloadFileSize = 250,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  )
end
