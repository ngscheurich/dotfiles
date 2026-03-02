local misc = require("mini.misc")

-- Global table to hold config data
_G.Config = {}

---Execute a function immediately
---@param f function
Config.now = function(f) misc.safely("now", f) end

---Enqueue a function to be executed without blocking
---@param f function
Config.later = function(f) misc.safely("later", f) end

---Execute a function once on an event
---@param ev string
---@param f function
Config.on_event = function(ev, f) misc.safely("event:" .. ev, f) end

---Execute a function once on filetype load
---@param ft string
---@param f function
Config.on_filetype = function(ft, f) misc.safely("filetype:" .. ft, f) end

-- Execute a function immediately if args were provided to `nvim`
Config.now_if_args = vim.fn.argc(-1) > 0 and Config.now or Config.later

-- Autocommand group for config
local group = vim.api.nvim_create_augroup("ngs.config", {})

---Create an autocommand in the `ngs.config` group
---@param event string
---@param pattern string|table
---@param callback function
---@param desc string
Config.autocmd = function(event, pattern, callback, desc)
  local opts =
    { group = group, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

---Hook to run when packages change (`see :h vim.pack-events`)
---@param plugin_name string
---@param kinds table
---@param callback function
---@param desc string
Config.on_packchanged = function(plugin_name, kinds, callback, desc)
  local f = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if not (name == plugin_name and vim.tbl_contains(kinds, kind)) then
      return
    end
    if not ev.data.active then vim.cmd.packadd(plugin_name) end
    callback()
  end
  Config.autocmd("PackChanged", "*", f, desc)
end

---Set a Normal mode keymap
---@param lhs string
---@param rhs string|function
---@param desc string?
Config.nmap = function(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { desc = desc })
end

---Set a Normal mode `<Leader>` keymap
---@param lhs string
---@param rhs string|function
---@param desc string?
Config.nmap_leader = function(lhs, rhs, desc)
  Config.nmap("<Leader>" .. lhs, rhs, desc or "")
end
