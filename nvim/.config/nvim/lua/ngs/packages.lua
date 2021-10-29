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
    "windwp/nvim-autopairs",
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
    "EdenEast/nightfox.nvim",
    {"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim"},
    "folke/tokyonight.nvim",
    "folke/trouble.nvim",
    "hoob3rt/lualine.nvim",
    "kyazdani42/nvim-tree.lua",
    "kyazdani42/nvim-web-devicons",
    {"lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim"},
    {"liuchengxu/vista.vim", cmd = "Vista"},
    "lukas-reineke/indent-blankline.nvim",
    "mhinz/vim-startify",
    "norcalli/nvim-colorizer.lua",
    "nvim-lua/lsp-status.nvim",
    "onsails/lspkind-nvim",
    "rktjmp/lush.nvim",
    "romainl/vim-qf",
    {"voldikss/vim-floaterm", cmd = "FloaterNew"},
  }

  -- Notes and prose
  use {
    {"junegunn/limelight.vim", cmd = "Limelight"},
    {"junegunn/goyo.vim", cmd = "Goyo"},
    {"reedes/vim-pencil", cmd = {"Pencil", "PencilToggle"}},
  }

  -- Navigation
  use {
    "andymass/vim-matchup",
    "justinmk/vim-dirvish",
    "tpope/vim-projectionist",
    {"nvim-telescope/telescope.nvim", requires = {
      {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}},
    {"nvim-telescope/telescope-fzy-native.nvim",
      run = "git submodule init && git submodule update",
      config = function() require("telescope").load_extension("fzy_native") end},
  }

  -- Code intelligence
  use {
    "neovim/nvim-lspconfig",
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
    "nvim-treesitter/playground",
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
    {"dstein64/vim-startuptime", opt = true},
    {"janko/vim-test", cmd = {"TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit"}},
    "lukas-reineke/format.nvim",
    "tpope/vim-eunuch",
    "tpope/vim-fugitive",
    "tpope/vim-rsi",
  }

  use {
    "wincent/corpus", config = function ()
      CorpusDirectories = {
        ['~/Dropbox/Notes'] = {
          autoreference = 1,
          autotitle = 1,
          base = './',
          transform = 'local',
        },
      }
    end
  }

  return packer
end

return setmetatable({}, {
  __index = function(_, key)
    local packer = init()
    return packer[key]
  end,
})

