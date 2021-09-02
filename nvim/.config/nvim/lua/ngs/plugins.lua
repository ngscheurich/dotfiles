local function setup(name)
  return "require('cfg." .. name .. "')"
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
    {"junegunn/vim-easy-align", config = setup("easy_align")},
    {"justinmk/vim-sneak"},
    {"tpope/vim-abolish"},
    {"tpope/vim-commentary"},
    {"tpope/vim-repeat"},
    {"tpope/vim-sleuth"},
    {"tpope/vim-speeddating"},
    {"tpope/vim-surround"},
    {"tpope/vim-unimpaired"},
    {"windwp/nvim-autopairs", config = setup("autopairs")},
  }

  -- Language support
  use {
    {"HerringtonDarkholme/yats.vim"},
    {"MaxMEllon/vim-jsx-pretty"},
    {"calviken/vim-gdscript3"},
    {"cespare/vim-toml"},
    {"elixir-editors/vim-elixir"},
    {"ericpruitt/tmux.vim"},
    {"euclidianAce/BetterLua.vim"},
    {"hashivim/vim-terraform"},
    {"jparise/vim-graphql"},
    {"othree/html5.vim"},
    {"pangloss/vim-javascript"},
    {"plasticboy/vim-markdown"},
    {"rust-lang/rust.vim"},
  }

  --  User interface
  use {
    {"folke/trouble.nvim", config = setup("trouble")},
    {"folke/which-key.nvim", config = setup("which_key")},
    {"glepnir/galaxyline.nvim"},
    {"kyazdani42/nvim-tree.lua", config = setup("nvim_tree")},
    {"kyazdani42/nvim-web-devicons", config = setup("devicons")},
    {"lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim", config = setup("gitsigns")},
    {"liuchengxu/vista.vim", cmd = "Vista"},
    {"lukas-reineke/indent-blankline.nvim", config = setup("indent_blankline")},
    {"mhinz/vim-startify", config = setup("startify")},
    { "norcalli/nvim-colorizer.lua", config = function () require("colorizer").setup() end},
    {"nvim-lua/lsp-status.nvim"},
    {"onsails/lspkind-nvim", config = setup("lspkind")},
    {"romainl/vim-qf"},
    {"voldikss/vim-floaterm", config = setup("floaterm")},
  }

  -- Colorschemes
  use {
    {"axvr/photon.vim"},
    {"cocopon/iceberg.vim"},
    {"folke/tokyonight.nvim"},
  }

  -- Notes and prose
  use {
    {"junegunn/goyo.vim", cmd = "Goyo"},
    {"junegunn/limelight.vim", cmd = "Limelight"},
    {"reedes/vim-pencil", cmd = {"Pencil", "PencilToggle"}},
  }

  -- Navigation
  use {
    {"andymass/vim-matchup"},
    {"nvim-lua/popup.nvim"},
    {"nvim-lua/plenary.nvim"},
    {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = setup("telescope"),
    },
    {
      "nvim-telescope/telescope-fzy-native.nvim",
      requires = {{"nvim-telescope/telescope.nvim"}},
      run = "git submodule init && git submodule update",
      config = function () require("telescope").load_extension("fzy_native") end,
    },
    {"tpope/vim-projectionist"},
    {"justinmk/vim-dirvish"},
  }

  -- Code intelligence
  use {
    {"neovim/nvim-lspconfig", config = setup("lspconfig")},
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = setup("treesitter")},
    {"nvim-treesitter/playground"},
  }

  -- Tools
  use {
    {"L3MON4D3/LuaSnip", config = setup("luasnip")},
    -- TODO: This overrides filetype-based indent settings. Should be vice-versa.
    -- "editorconfig/editorconfig-vim",
    {"hrsh7th/nvim-compe", config = setup("compe")},
    {"janko/vim-test", config = setup("vim_test")},
    {"mhartington/formatter.nvim", config = setup("formatter")},
    {"~/Projects/iris.nvim", config = setup("iris")},
    {"tpope/vim-fugitive"},
    {"dstein64/vim-startuptime", opt = true},
    {"tpope/vim-eunuch"},
    {"tpope/vim-rsi"},
  }

  return packer
end

return setmetatable({}, {
  __index = function(_, key)
    local packer = init()
    return packer[key]
  end
})
