(module config.plugin.lsp.sumneko-lua
  {autoload {lspconfig lspconfig}})

(fn setup [config]
  (let [root "/usr/local/opt/lua-language-server"
        bin (.. root "/bin/macOS/lua-language-server")
        main (.. root "/main.lua")
        rtp (vim.split package.path ";")]

    (table.insert rtp "lua/?.lua")
    (table.insert rtp "lua/?/init.lua")

    (lspconfig.sumneko_lua.setup
      (vim.tbl_extend
        :force
        config
        {:cmd [bin :-E main]
         :settings
         {:Lua {:runtime     {:version :LuaJIT :path rtp}
                :diagnostics {:globals {1 :vim 2 :ngs}}
                :workspace   {:library (vim.api.nvim_get_runtime_file "" true)
                              :preloadFileSize 250}
                :telemetry   {:enable false}}}}))))
