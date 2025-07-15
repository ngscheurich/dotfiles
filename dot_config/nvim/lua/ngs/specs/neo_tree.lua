-- ===================================================================
--  Neo-tree
-- -------------------------------------------------------------------
--  https://github.com/nvim-neo-tree/neo-tree.nvim
--  View and manage the file system and other tree-like structures
--  ui
-- -------------------------------------------------------------------
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },

  opts = {
    close_if_last_window = true,
    default_component_configs = {
      indent = {
        with_expanders = true,
        with_markers = false,
      },
    },
    filesystem = {
      hijack_netrw_behavior = "disabled",
    },
    window = { width = 30 },
    source_selector = { winbar = true },
  },

  keys = {
    {
      "<Leader>ee",
      "<Cmd>Neotree action=focus source=filesystem position=left reveal=true<CR>",
      desc = "Files",
    },
    {
      "<Leader>eb",
      "<Cmd>Neotree action=focus source=buffers position=left<CR>",
      desc = "Buffers",
    },
    {
      "<Leader>eg",
      "<Cmd>Neotree action=focus source=git_status position=left<CR>",
      desc = "Git status",
    },
    {
      "<Leader>eF",
      "<Cmd>Neotree action=focus source=filesystem position=float reveal=true<CR>",
      desc = "Files (Floating)",
    },
  },
}
