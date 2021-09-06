local fn = vim.fn

local function ch_shorten(branch)
  return string.match(branch, [[^.+/(ch%d+)/.*]])
end

local providers = {}

providers.ngs_cursor_position = function ()
  local line = fn.line(".")
  local col = fn.col(".")
  return line .. ":" .. col
end

providers.ngs_byte_percent = function ()
  local byte = fn.line2byte(fn.line( "." )) + fn.col( "." ) - 1
  local size = fn.line2byte(fn.line( "$" ))
  return math.abs(math.floor(byte * 100 / size)) .. "％"
end

providers.ngs_file_type = function ()
  local lsp_status = ""
  if next(vim.lsp.buf_get_clients()) ~= nil then
    lsp_status = "  "
  end
  return lsp_status .. vim.bo.filetype
end

providers.ngs_git_branch = function ()
  local head = vim.fn["fugitive#Head"]()
  return ch_shorten(head) or head
end

for name, func in pairs(providers) do
  require("feline.providers").add_provider(name, func)
end
