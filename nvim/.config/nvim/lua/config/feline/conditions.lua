local fn = vim.fn

local M = {}

function M.git_workspace()
  if not fn.exists("g:loaded_fugitive") and fn["fugitive#Head"]() then
    return true
  end

  return false
end

return M
