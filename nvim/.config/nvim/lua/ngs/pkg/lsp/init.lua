local lspconfig = require("lspconfig")

-- Function to run on client attach
local function on_attach(_, bufnr)
    local function map(lhs, rhs)
        vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, rhs, {noremap = true, silent = true})
    end

    map("<C-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>")
    map("K",     "<Cmd>lua vim.lsp.buf.hover()<CR>")
    map("[d",    "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
    map("]d",    "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>")

    map("<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
    map("<Leader>ld", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
    map("<Leader>lf", "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>")
    map("<Leader>lR", "<Cmd>lua vim.lsp.buf.rename()<CR>")
    map("<Leader>lr", "<Cmd>lua require('telescope.builtin').lsp_references()<CR>")
    map("<Leader>ls", "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
    map("<Leader>lt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>")
end

-- Shared server config
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local config = {on_attach = on_attach, capabilities = capabilities}

-- Servers to register with default config
local default_servers = {
    "gdscript",
    "haxe_language_server",
    "metals",
    "omnisharp",
    "pyright",
    "rls",
    "sumneko_lua",
    "terraformls",
    "vimls",
}

for _, server in ipairs(default_servers) do
    lspconfig[server].setup(config)
end

-- Servers to register with custom config
local custom_servers = {
    "elixirls",
    "haxe_language_server",
    "omnisharp",
    "sumneko_lua",
    "tsserver",
}

for _, server in ipairs(custom_servers) do
    require("ngs.pkg.lsp.servers." .. server)(config)
end

-- Format on save for servers that support it
local pat = table.concat({ "*.ex", "*.exs"}, ",")
ngs.vim.augroup("lspformat", function()
    ngs.vim.autocmd("BufWritePre", pat, "lua vim.lsp.buf.formatting_sync()")
end)
