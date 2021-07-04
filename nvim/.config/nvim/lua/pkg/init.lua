local function init()
  vim.cmd("packadd paq-nvim")
  local paq_nvim = require("paq-nvim")
  local paq = paq_nvim.paq

  -- Paq
  paq {"savq/paq-nvim", opt = true}

  -- Editing
  paq "junegunn/vim-easy-align"
  paq "justinmk/vim-sneak"
  paq "tpope/vim-abolish"
  paq "tpope/vim-commentary"
  paq {"tpope/vim-endwise", opt = true}
  paq "tpope/vim-repeat"
  paq "tpope/vim-sleuth"
  paq "tpope/vim-speeddating"
  paq "tpope/vim-surround"
  paq "tpope/vim-unimpaired"
  paq "windwp/nvim-autopairs"

  -- Language support
  paq "HerringtonDarkholme/yats.vim"
  paq "MaxMEllon/vim-jsx-pretty"
  paq "calviken/vim-gdscript3"
  paq "cespare/vim-toml"
  paq "elixir-editors/vim-elixir"
  paq "ericpruitt/tmux.vim"
  paq "euclidianAce/BetterLua.vim"
  paq "hashivim/vim-terraform"
  paq "jparise/vim-graphql"
  paq "othree/html5.vim"
  paq "pangloss/vim-javascript"
  paq "plasticboy/vim-markdown"
  paq "rust-lang/rust.vim"

  --  User interface
  paq "folke/trouble.nvim"
  paq "folke/which-key.nvim"
  paq "glepnir/galaxyline.nvim"
  paq "kyazdani42/nvim-tree.lua"
  paq "kyazdani42/nvim-web-devicons"
  paq "lewis6991/gitsigns.nvim"
  paq "liuchengxu/vista.vim"
  paq "lukas-reineke/indent-blankline.nvim"
  paq "mhinz/vim-startify"
  paq "norcalli/nvim-colorizer.lua"
  paq "nvim-lua/lsp-status.nvim"
  paq "onsails/lspkind-nvim"
  paq "romainl/vim-qf"
  paq "voldikss/vim-floaterm"

  -- Colorschemes
  paq "RRethy/nvim-base16"
  paq "axvr/photon.vim"
  paq "bluz71/vim-moonfly-colors"
  paq "cocopon/iceberg.vim"
  -- paq "folke/tokyonight.nvim"
  paq "rakr/vim-two-firewatch"

  -- Notes and prose
  paq "junegunn/goyo.vim"
  paq "junegunn/limelight.vim"
  paq "reedes/vim-pencil"

  -- Navigation
  paq "andymass/vim-matchup"
  paq "nvim-lua/popup.nvim"
  paq "nvim-lua/plenary.nvim"
  paq "nvim-telescope/telescope.nvim"
  paq {"nvim-telescope/telescope-fzy-native.nvim", run = "git subget"}
  paq "tpope/vim-projectionist"
  paq "justinmk/vim-dirvish"

  -- Code intelligence
  paq "neovim/nvim-lspconfig"
  paq {"nvim-treesitter/nvim-treesitter", run = function () vim.cmd("TSUpdate") end}
  paq "nvim-treesitter/playground"

  -- Tools
  paq {"bfredl/nvim-luadev", opt = true}
  paq "editorconfig/editorconfig-vim"
  paq "hrsh7th/nvim-compe"
  paq "hrsh7th/vim-vsnip"
  paq "hrsh7th/vim-vsnip-integ"
  paq "janko/vim-test"
  paq "mhartington/formatter.nvim"
  -- paq "ngscheurich/iris.nvim"
  paq "tpope/vim-fugitive"
  paq {"dstein64/vim-startuptime", opt = true}
  paq "tpope/vim-eunuch"
  paq "tpope/vim-rsi"

  return paq_nvim
end

return setmetatable({}, {
  __index = function(_, key)
    local paq_nvim = init()
    return paq_nvim[key]
  end
})
