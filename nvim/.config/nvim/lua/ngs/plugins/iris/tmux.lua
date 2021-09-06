return function()
  local arg = require("iris").json()
  local cmd = string.format('tmux-theme "%1s"', arg)

  local job = vim.loop.new_async(vim.schedule_wrap(function()
      vim.fn.system(cmd)
  end))

  job:send()
end
