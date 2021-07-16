local function config(name)
  return "require('config." .. name .. "')"
end

local function init()
  vim.cmd [[packadd packer.nvim]]

  local packer = require("packer")
  local use = packer.use
  packer.init({disable_commands = true})

  -- Packer
  use {"wbthomason/packer.nvim", opt = true}

  -- Editing
  use {
    {
      "junegunn/vim-easy-align",
      run = {":nmap ga <Plug>(EasyAlign)", ":xmap ga <Plug>(EasyAlign)"}
    },
    "justinmk/vim-sneak",
    "tpope/vim-abolish",
    "tpope/vim-commentary",
    "tpope/vim-repeat",
    "tpope/vim-sleuth",
    "tpope/vim-speeddating",
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
    {"windwp/nvim-autopairs", config = config("autopairs")},
  }

  -- Language support
  use {
    "HerringtonDarkholme/yats.vim",
    "MaxMEllon/vim-jsx-pretty",
    "calviken/vim-gdscript3",
    "cespare/vim-toml",
    "elixir-editors/vim-elixir",
    "ericpruitt/tmux.vim",
    "euclidianAce/BetterLua.vim",
    "hashivim/vim-terraform",
    "jparise/vim-graphql",
    "othree/html5.vim",
    "pangloss/vim-javascript",
    "plasticboy/vim-markdown",
    "rust-lang/rust.vim",
  }

  --  User interface
  use {
    {"folke/trouble.nvim", config = function () require("trouble").setup() end},
    {"folke/which-key.nvim", config = config("whichkey")},
    "glepnir/galaxyline.nvim",
    {"kyazdani42/nvim-tree.lua", config = config("nvim_tree")},
    {"kyazdani42/nvim-web-devicons", config = config("devicons")},
    {
      "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim",
      config = config("gitsigns"),
    },
    {"liuchengxu/vista.vim", cmd = "Vista"},
    {"lukas-reineke/indent-blankline.nvim", config = config("indent_blankline")},
    {"mhinz/vim-startify", config = config("startify")},
    { "norcalli/nvim-colorizer.lua", config = function () require("colorizer").setup() end},
    "nvim-lua/lsp-status.nvim",
    {"onsails/lspkind-nvim", config = config("lspkind")},
    "romainl/vim-qf",
    {
      "voldikss/vim-floaterm",
      run = {
        ":nnoremap <Leader>xe <Cmd>FloatermNew ranger<CR>",
        ":nnoremap <Leader>xg <Cmd>FloatermNew lazygit<CR>",
      },
    },
  }

  -- Colorschemes
  use {
    "RRethy/nvim-base16",
    "axvr/photon.vim",
    "bluz71/vim-moonfly-colors",
    "folke/tokyonight.nvim",
  }

  -- Notes and prose
  use {
    {"junegunn/goyo.vim", cmd = "Goyo"},
    {"junegunn/limelight.vim", cmd = "Limelight"},
    {"reedes/vim-pencil", cmd = {"Pencil", "PencilToggle"}},
  }

  -- Navigation
  use {
    "andymass/vim-matchup",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = config("telescope"),
    },
    {
      "nvim-telescope/telescope-fzy-native.nvim",
      run = "git submodule init && git submodule update",
      config = function () require("telescope").load_extension("fzy_native") end,
    },
    "tpope/vim-projectionist",
    "justinmk/vim-dirvish",
  }

  -- Code intelligence
  use {
    {"neovim/nvim-lspconfig", config = config("lspconfig")},
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = config("treesitter")},
    "nvim-treesitter/playground",
  }

  -- Tools
  use {
    {"L3MON4D3/LuaSnip", config = config("luasnip")},
    {
      "bfredl/nvim-luadev", cmd = "Luadev", run = {
        ":nmap <Leader>rl <Plug>(Luadev-Runline)",
        ":vmap <Leader>rl <Plug>(Luadev-Run)",
      },
    },
    "editorconfig/editorconfig-vim",
    {"hrsh7th/nvim-compe", config = config("compe")},
    {"janko/vim-test", config = config("vim_test")},
    {"mhartington/formatter.nvim", config = config("formatter")},
    {"ngscheurich/iris.nvim", config = config("iris")},
    "tpope/vim-fugitive",
    {"dstein64/vim-startuptime", opt = true},
    "tpope/vim-eunuch",
    "tpope/vim-rsi",
  }

  return packer
end

return setmetatable({}, {
  __index = function(_, key)
    local packer = init()
    return packer[key]
  end
})
