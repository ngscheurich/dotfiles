-- chezmoi.nvim
vim.g["chezmoi#use_tmp_buffer"] = true

-- mini.bracketed
local bracketed_ok, bracketed = pcall(require, "mini.bracketed")
if bracketed_ok then
  bracketed.setup()
end

-- oil.nvim
local oil_ok, oil = pcall(require, "oil")
if oil_ok then
  local detail = false
  oil.setup({
    keymaps = {
      ["gd"] = {
        desc = "Toggle file detail view",
        callback = function()
          detail = not detail
          if detail then
            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
          else
            require("oil").set_columns({ "icon" })
          end
        end,
      },
    },
  })

  vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
end

-- quicker.nvim
local function load_quicker()
  local quicker_ok, quicker = pcall(require, "quicker")
  if quicker_ok then
    quicker.setup()
  end
end

vim.api.nvim_create_autocmd("FileType", {
  desc = "Load quicker.nvim",
  group = vim.api.nvim_create_augroup("ngs.packages.quicker", {}),
  pattern = "qf",
  callback = function()
    if not package.loaded["quicker"] then
      load_quicker()
    end
  end,
})

-- vim-slime
vim.g.slime_target = "tmux"
