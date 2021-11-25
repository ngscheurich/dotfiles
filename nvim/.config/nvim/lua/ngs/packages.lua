local function init()
  vim.cmd "packadd packer.nvim"

  local packer = require("packer")
  local use = packer.use
  packer.init({disable_commands = true})

  -- Packer
  use {"wbthomason/packer.nvim", opt = true}

  -- Editing
  use {
    "junegunn/vim-easy-align",
    "justinmk/vim-sneak",
    "tpope/vim-abolish",
    "tpope/vim-commentary",
    "tpope/vim-repeat",
    "tpope/vim-sleuth",
    "tpope/vim-speeddating",
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
  }

  use {
    "windwp/nvim-autopairs",
    config = "require('ngs.pkg.autopairs')"
  }

  -- Languages
  use {
    "calviken/vim-gdscript3",
    "cespare/vim-toml",
    "elixir-editors/vim-elixir",
    "ericpruitt/tmux.vim",
    "euclidianAce/BetterLua.vim",
    "hashivim/vim-terraform",
    "HerringtonDarkholme/yats.vim",
    "jparise/vim-graphql",
    "MaxMEllon/vim-jsx-pretty",
    "othree/html5.vim",
    "pangloss/vim-javascript",
    "plasticboy/vim-markdown",
    "rust-lang/rust.vim",
  }

  --  Interface
  use {
    "kyazdani42/nvim-web-devicons",
    config = "require('ngs.pkg.icons')"
  }

  use {
    "folke/tokyonight.nvim",
    config = function ()
      vim.g.tokyonight_style = "night"
      vim.cmd [[colorscheme tokyonight]]
    end,
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = "require('todo-comments').setup()"
  }

  use {
    "folke/trouble.nvim",
    config = "require('trouble').setup()",
  }

  use {
    "kyazdani42/nvim-tree.lua",
    config = "require('ngs.pkg.tree')",
  }

  use {
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  use {
    "liuchengxu/vista.vim",
    cmd = "Vista",
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = "require('ngs.pkg.indent')",
  }

  use {
    "mhinz/vim-startify",
    config = "require('ngs.pkg.startify')",
  }

  use {
    "norcalli/nvim-colorizer.lua",
    config = "require('colorizer').setup()",
  }

  use {
    "voldikss/vim-floaterm",
    cmd = "FloaterNew",
  }

  -- Navigation
  use {
    "andymass/vim-matchup",
    "ggandor/lightspeed.nvim",
    "justinmk/vim-dirvish",
    "tpope/vim-projectionist",
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
  }

  use {
    "nvim-telescope/telescope-fzy-native.nvim",
    run = "git submodule init && git submodule update",
    config = "require('telescope').load_extension('fzy_native')",
  }

  -- Code intelligence
  use {
    "neovim/nvim-lspconfig",
    config = "require('ngs.pkg.lsp')",
  }

  use "nvim-treesitter/playground"

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Completion and snippets
  use {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
  }

  -- Tools
  use {
    "lukas-reineke/format.nvim",
    "tpope/vim-eunuch",
    "tpope/vim-fugitive",
    "tpope/vim-rsi",
  }

  use {
    "mhartington/formatter.nvim",
    config = "require('ngs.pkg.formatter')"
  }

  -- Notes and prose
  use {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
  }

  use {
    "reedes/vim-pencil",
    cmd = {"PencilSoft", "PencilToggle"},
  }

  use {
    "janko/vim-test",
    cmd = {"TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit"},
  }

  return packer
end

return setmetatable({}, {
  __index = function(_, key)
    local packer = init()
    return packer[key]
  end,
})

