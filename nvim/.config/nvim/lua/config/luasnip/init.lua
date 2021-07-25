local ls = require'luasnip'
local parse = ls.parser.parse_snippet
local s, t, i = ls.s, ls.t, ls.i

ls.snippets = {
  elixir = {
    parse({trig = "pry"}, "require IEx\nIEx.pry()")
  },

  lua = {
    s("fn", {
      t("function "), i(1, {"name"}), t("("), i(2, "params"), t(")"),
      t({"", "  "}), i(3),
      t({"", "end"}), i(0),
    }),
  },

  typescriptreact = {
    parse({trig = "log"}, [[console.log($1);$0"]]),
    parse({trig = "logvar"}, [[console.log("$1", $1);$0]]),
  },
}
