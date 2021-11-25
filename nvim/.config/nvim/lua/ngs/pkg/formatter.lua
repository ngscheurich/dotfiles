local prettier = function ()
  local filepath = vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))

  return {
    exe = "npx",
    args = {"prettier", "--stdin-filepath", filepath},
    stdin = true
  }
end

require("formatter").setup({
  filetype = {
    javascript = {prettier},
    typescript = {prettier},
  },
})

ngs.vim.augroup("autoformat", function ()
  ngs.vim.autocmd("BufWritePost", "*.js,*ts,*.tsx", "FormatWrite")
end)
