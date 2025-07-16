vim.lsp.config["typescript_ls"] = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript" },
  root_markers = { ".git" },
}
