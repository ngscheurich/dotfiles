local function config(name)
  return "require('plugins." .. name .. "')"
end

local function init()
  vim.cmd "packadd packer.nvim"

  local packer = require("packer")
  local use = packer.use
  packer.init({disable_commands = true})

  -- Packer
  use {"wbthomason/packer.nvim", opt = true}

  -- Editing
  use {
    "justinmk/vim-sneak",
    "tpope/vim-abolish",
    "tpope/vim-commentary",
    "tpope/vim-repeat",
    "tpope/vim-sleuth",
    "tpope/vim-speeddating",
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
    {"junegunn/vim-easy-align", config = config("easy_align")},
    {"windwp/nvim-autopairs", config = config("autopairs")},
  }

  -- Language support
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

  --  User interface
  use {
    "romainl/vim-qf",
    {"famiu/feline.nvim", config = config("feline")},
    {"folke/trouble.nvim", config = config("trouble")},
    -- This commit keeps nvim-tree from breaking dirvish
    {"kyazdani42/nvim-tree.lua", config = config("nvim_tree"), commit = "dc630d199a0ad593036d193232c6b338aa0407e3"},
    {"kyazdani42/nvim-web-devicons", config = config("devicons")},
    {"lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim", config = config("gitsigns")},
    {"liuchengxu/vista.vim", cmd = "Vista"},
    {"lukas-reineke/indent-blankline.nvim", config = config("indent_blankline")},
    {"mhinz/vim-startify", config = config("startify")},
    {"norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end},
    {"nvim-lua/lsp-status.nvim"},
    {"onsails/lspkind-nvim", config = config("lspkind")},
    "rktjmp/lush.nvim",
    {"voldikss/vim-floaterm", config = config("floaterm")},
  }

  -- Colorschemes
  use {"axvr/photon.vim", "cocopon/iceberg.vim", "folke/tokyonight.nvim"}

  -- Notes and prose
  use {
    {"junegunn/goyo.vim", cmd = "Goyo"},
    {"junegunn/limelight.vim", cmd = "Limelight"},
    {"reedes/vim-pencil", cmd = {"Pencil", "PencilToggle"}},
  }

  -- Navigation
  use {
    "andymass/vim-matchup",
    "justinmk/vim-dirvish",
    "tpope/vim-projectionist",
    {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = config("telescope"),
    },
    {
      "nvim-telescope/telescope-fzy-native.nvim",
      requires = {{"nvim-telescope/telescope.nvim"}},
      run = "git submodule init && git submodule update",
      config = function()
        require("telescope").load_extension("fzy_native")
      end,
    },
  }

  -- Code intelligence
  use {
    "nvim-treesitter/playground",
    {"neovim/nvim-lspconfig", config = config("lspconfig")},
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = config("treesitter"),
    },
  }

  -- Tools
  use {
    "tpope/vim-fugitive",
    "tpope/vim-eunuch",
    "tpope/vim-rsi",
    {"L3MON4D3/LuaSnip", config = config("luasnip")},
    {"hrsh7th/nvim-compe", config = config("compe")},
    {"janko/vim-test", config = config("vim_test")},
    {"lukas-reineke/format.nvim", config = config("format")},
    -- {"~/Projects/iris.nvim", config = config("iris")},
    {"dstein64/vim-startuptime", opt = true},
  }

  return packer
end

return setmetatable({}, {
  __index = function(_, key)
    local packer = init()
    return packer[key]
  end,
})
