local whichkey = require("which-key")

whichkey.setup({icons = {breadcrumb = "»", separator = "", group = "+"}})

whichkey.register({
  b = {name = "buffer", d = "delete", h = "home", n = "next", p = "previous"},
  e = {name = "explore", e = "toggle-tree", f = "goto-file"},
  f = {
    name = "find",
    b = "buffers",
    f = "files",
    g = "grep",
    h = "help",
    r = "registers",
    t = "tree-sitter",
  },
  g = {
    name = "git",
    b = "blame-line",
    p = "preview-hunk",
    r = "reset-hunk",
    R = "reset-buffer",
    s = "stage-hunk",
    u = "unstage-hunk",
  },
  l = {
    name = "lsp",
    a = "code-action",
    d = "goto-definition",
    D = "line-diagnostics",
    f = "format-buffer",
    h = "hover",
    r = "references",
    s = "document-symbols",
    S = "workspace-symbols",
  },
  r = {
    name = "run",
    l = "lua",
  },
  t = {
    name = "test",
    f = "file",
    l = "last",
    n = "nearest",
    s = "suite",
    v = "visit",
  },
  u = {
    name = "ui-toggle",
    i = "indent-guides",
    n = "line-numbers",
    s = "signcolumn",
    g = {
      name = "git",
      s = "signs",
      b = "blame",
    },
  },
  w = {
    name = "windows",
    s = "horizontal-split",
    v = "vertical-split",
    o = "only",
    ["="] = "equalize",
  },
  x = {name = "external", e = "explorer", g = "git"},
}, {prefix = "<Leader>"})
