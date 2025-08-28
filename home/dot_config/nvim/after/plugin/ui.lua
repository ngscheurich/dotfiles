-- Aerial
local aerial_ok, aerial = pcall(require, "aerial")
if aerial_ok then
  aerial.setup({
    on_attach = function(buffer)
      vim.keymap.set("n", "}", "<Cmd>AerialNext<CR>", { buffer = buffer })
      vim.keymap.set("n", "{", "<Cmd>AerialPrev<CR>", { buffer = buffer })
    end,
  })

  vim.keymap.set("n", "<Leader>o", "<Cmd>AerialToggle!<CR>", { desc = "Outline" })
  vim.keymap.set("n", "gO", function()
    require("aerial").snacks_picker()
  end, { desc = "Symbols" })
end

-- bufferline.nvim
local function load_bufferline()
  local bufferline_ok, bufferline = pcall(require, "bufferline")
  if bufferline_ok then
    bufferline.setup({
      options = {
        mode = "tabs",
        indicator = { icon = "┃" },
      },
    })
  end
end

vim.api.nvim_create_autocmd({ "TabEnter", "TabNew", "TabNewEntered" }, {
  desc = "Load bufferline.nvim",
  group = vim.api.nvim_create_augroup("ngs.packges.bufferline", {}),
  callback = function()
    if not package.loaded["bufferline"] then
      load_bufferline()
    end
  end,
})

-- dropbar.nvim
local dropbar_ok, dropbar = pcall(require, "dropbar")
if dropbar_ok then
  dropbar.setup({
    bar = { enable = false },
  })

  vim.keymap.set("n", "<Leader>tb", function()
    if vim.o.winbar == "" then
      vim.opt.winbar = "%{%v:lua.dropbar()%}"
    else
      vim.opt.winbar = ""
    end
  end, { desc = "Breadcrumbs" })
end

-- Fidget
local function load_fidget()
  local fidget_ok, fidget = pcall(require, "fidget")
  if fidget_ok then
    fidget.setup({
      progress = {
        display = { done_icon = "" },
      },
    })
  end
end

vim.api.nvim_create_autocmd("LspProgress", {
  desc = "Load Fidget",
  group = vim.api.nvim_create_augroup("ngs.packages.fidget", {}),
  callback = function()
    if not package.loaded["fidget"] then
      load_fidget()
    end
  end,
})

-- mini.hipatterns
local hipatterns_ok, hipatterns = pcall(require, "mini.hipatterns")
if hipatterns_ok then
  hipatterns.setup({
    highlighters = {
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
      todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end

-- mini.icons
local icons_ok, icons = pcall(require, "mini.icons")
if icons_ok then
  icons.setup()
end

-- nvim-scrollbar
local scrollbar_ok, scrollbar = pcall(require, "scrollbar")
if scrollbar_ok then
  scrollbar.setup({
    hide_if_all_visible = true,
    excluded_buftypes = {},
    excluded_filetypes = {
      "popup",
      "blink-cmp-menu",
      "blink-cmp-signature",
      "blink-cmp-documentation",
    },
    handlers = {
      gitsigns = true,
    },
  })
end

-- nvim-ufo
local ufo_ok, ufo = pcall(require, "ufo")
if ufo_ok then
  vim.opt.foldmethod = "manual"
  vim.opt.foldcolumn = "1"
  vim.opt.foldlevel = 99
  vim.opt.foldlevelstart = 99
  vim.opt.foldenable = true

  ufo.setup()

  vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
end

-- Trouble
local trouble_ok, trouble = pcall(require, "trouble")
if trouble_ok then
  trouble.setup()

  local function map(lhs, rhs, opts)
    vim.keymap.set("n", lhs, rhs, opts)
  end

  map("<Leader>ld", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Diagnostics (buffer)" })
  map("<Leader>lD", "<Cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
  map("<Leader>ll", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list" })
  map("<Leader>lq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list" })
end

-- tiny-glimmer.nvim
local tiny_glimmer_ok, tiny_glimmer = pcall(require, "tiny-glimmer")
if tiny_glimmer_ok then
  tiny_glimmer.setup({
    overwrite = {
      search = { enabled = true },
      undo = { enabled = true },
      redo = { enabled = true },
    },
  })
end

-- WhichKey
local which_key_ok, which_key = pcall(require, "which-key")
if which_key_ok then
  which_key.setup({
    icons = { mappings = false },
  })

  which_key.add({
    { "<Leader>a", group = "ai" },
    { "<Leader>ac", group = "codecompanion" },
    { "<Leader>e", group = "explore" },
    { "<Leader>f", group = "find" },
    { "<Leader>g", group = "git" },
    { "<Leader>l", group = "list" },
    { "<Leader>n", group = "notes" },
    { "<Leader>s", group = "search" },
    { "<Leader>t", group = "toggle" },
    { "<LocalLeader>t", group = "test" },
  })
end

-- incline
local incline_ok, incline = pcall(require, "incline")
if incline_ok then
  local util = require("ngs.util")
  local helpers = require("incline.helpers")

  incline.setup({
    hide = {
      focused_win = true,
      only_win = true,
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      local modified = vim.bo[props.buf].modified
      local icon, hl = MiniIcons.get("file", filename)
      local bg = util.get_hl_attr(hl, "fg")
      local fg = nil
      if filename == "" then
        filename = "[No Name]"
      end
      if bg and bg ~= "" then
        fg = bg and helpers.contrast_color(bg)
      end

      return {
        icon and { " ", icon, " ", guibg = bg, guifg = fg } or "",
        " ",
        { filename, gui = modified and "bold,italic" or "" },
        " ",
      }
    end,
  })
end
