local later, nmap_leader, now = Config.later, Config.nmap_leader, Config.now
local util = require("ngs.util")

now(function()
  require("mini.icons").setup()

  -- Load theme
  util.load_theme()
  Config.theme.setup()
end)

later(function()
  require("mini.align").setup()
  require("mini.ai").setup()
  require("mini.bracketed").setup()
  -- TODO: Remap to e.g. `<M-S-h>`?
  -- require("mini.move").setup()
  require("mini.splitjoin").setup()
  require("mini.surround").setup()
  require("mini.trailspace").setup()

  -- Highlight text patterns
  local hipatterns = require("mini.hipatterns")
  local extra = require("mini.extra")
  extra.setup()
  local hi_words = extra.gen_highlighter.words
  hipatterns.setup({
    highlighters = {
      fixme = hi_words({ "FIXME" }, "MiniHipatternsFixme"),
      hack = hi_words({ "HACK" }, "MiniHipatternsHack"),
      todo = hi_words({ "TODO" }, "MiniHipatternsTodo"),
      note = hi_words({ "NOTE" }, "MiniHipatternsNote"),

      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })

  -- Manage sessions
  require("mini.sessions").setup()
  local session_new = 'MiniSessions.write(vim.fn.input("Session name: "))'
  nmap_leader("sd", '<Cmd>lua MiniSessions.select("delete")<CR>', "Delete")
  nmap_leader("sn", "<Cmd>lua " .. session_new .. "<CR>", "New")
  nmap_leader("sr", '<Cmd>lua MiniSessions.select("read")<CR>', "Read")
  nmap_leader("sw", "<Cmd>lua MiniSessions.write()<CR>", "Write current")
end)
