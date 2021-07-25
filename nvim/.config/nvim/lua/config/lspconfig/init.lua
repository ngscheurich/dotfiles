local lspconfig = require("lspconfig")

local function on_attach(_, bufnr)
  local function map(lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, rhs, {noremap = true,silent = true})
  end

  map("<C-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  map("K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  map("[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  map("d]", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>")

  map("<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
  map("<Leader>ld", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  map("<Leader>lf", "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>")
  map("<Leader>lR", "<Cmd>lua vim.lsp.buf.rename()<CR>")
  map("<Leader>lr", "<Cmd>lua require('telescope.builtin').lsp_references()<CR>")
  map("<Leader>ls", "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
  map("<Leader>lt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local config = {
  on_attach = on_attach,
  capabilities = capabilities,
}

local servers = {
  "elixirls",
  "gdscript",
  "haxe_language_server",
  "omnisharp",
  "rls",
  "sumneko_lua",
  "terraformls",
  "tsserver",
  "vimls",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup(config)
end

servers = {
  -- "efm",
  "elixirls",
  "haxe_language_server",
  "omnisharp",
  "sumneko_lua",
  "tsserver",
}

for _, server in ipairs(servers) do
  require("config.lspconfig." .. server)(config)
end
