(module config.package.init
  {autoload {a aniseed.core
             packer packer}})

(defn- require-mod [key val]
  (match [key val]
    (where [:module mod]
           (= :string (type mod)))
    [:config (.. "require('config.plugin." (.. mod "')"))]
    _
    [key val]))

(defn- startup [packer-use]
  (local use
    (fn [repo ...]
      (let [tbl {}]
        (a.assoc tbl 1 repo)
        (for [i 1 (a.count [...]) 2]
          (let [k (. [...] i)
                v (. [...] (+ i 1))
                [key val] (require-mod k v)]
            (a.assoc tbl key val)))
        (packer-use tbl))))

  ;; Packer
  (use :wbthomason/packer.nvim)

  ;; Editing
  (use :junegunn/vim-easy-align)
  (use :numToStr/Comment.nvim
       :config "require('Comment').setup()")
  (use :tpope/vim-repeat)
  (use :tpope/vim-speeddating)
  (use :tpope/vim-surround)
  (use :windwp/nvim-autopairs
       :module :autopairs)

  ;; Interface
  (use :feline-nvim/feline.nvim
       :module :feline)
  (use :folke/tokyonight.nvim
       :config (fn []
                 (set vim.g.tokyonight_style :night)
                 (vim.cmd "colorscheme tokyonight")))
  (use :folke/todo-comments.nvim
       :requires [:nvim-lua/plenary.nvim])
  (use :kyazdani42/nvim-web-devicons
       :module :icons)
  (use :lukas-reineke/indent-blankline.nvim
       :module :indent)
  (use :norcalli/nvim-colorizer.lua
       :config "require('colorizer').setup()")
  (use :https://gitlab.com/yorickpeterse/nvim-pqf.git
       :config "require('pqf').setup()")

  ;; Navigation
  (use :andymass/vim-matchup)
  (use :folke/trouble.nvim
       :config "require('trouble').setup()")
  (use :ggandor/lightspeed.nvim)
  (use :justinmk/vim-dirvish)
  (use :kyazdani42/nvim-tree.lua
       :module :tree)
  (use :nvim-telescope/telescope.nvim
       :requires [:nvim-lua/plenary.nvim :nvim-lua/popup.nvim]
       :module :telescope)
  (use :nvim-telescope/telescope-fzy-native.nvim
       :requires [:nvim-telescope/telescope.nvim]
       :after :telescope.nvim
       :run "git submodule init && git submodule update"
       :config "require('telescope').load_extension('fzy_native')")

  ;; Languages
  (use :HerringtonDarkholme/yats.vim)
  (use :MaxMEllon/vim-jsx-pretty)
  (use :calviken/vim-gdscript3)
  (use :cespare/vim-toml)
  (use :dag/vim-fish)
  (use :elixir-editors/vim-elixir)
  (use :ericpruitt/tmux.vim)
  (use :euclidianAce/BetterLua.vim)
  (use :hashivim/vim-terraform)
  (use :jparise/vim-graphql)
  (use :othree/html5.vim)
  (use :pangloss/vim-javascript)
  (use :rust-lang/rust.vim)

  ;; Code Intelligence
  (use :neovim/nvim-lspconfig
       :module :lsp)
  (use :jose-elias-alvarez/null-ls.nvim
       :requires [:jose-elias-alvarez/null-ls.nvim])
  (use :nvim-treesitter/nvim-treesitter
       :run ":TSUpdate"
       :module :treesitter)
  (use :nvim-treesitter/playground)

  ;; Completion & Snippets
  (use :L3MON4D3/LuaSnip)
  (use :hrsh7th/cmp-buffer)
  (use :hrsh7th/cmp-nvim-lsp)
  (use :hrsh7th/nvim-cmp
       :module :cmp)
  (use :saadparwaiz1/cmp_luasnip)

  ;; Source Control
  (use :lewis6991/gitsigns.nvim
       :requires [:nvim-lua/plenary.nvim]
       :module :gitsigns)
  (use :tpope/vim-fugitive)

  ;; Notes & Prose
  (use :dhruvasagar/vim-table-mode)
  (use :folke/zen-mode.nvim
       :cmd :ZenMode)
  (use :reedes/vim-pencil
       :cmd :PencilSoft)
  (use :vimwiki/vimwiki
       :module :vimwiki)

  ;; Utilities
  (use :Olical/aniseed)
  (use :Olical/nvim-local-fennel
       :requires [:Olical/aniseed])
  (use :Olical/conjure)
  (use :janko/vim-test
       :cmd [:TestFile :TestLast :TestNearest :TestSuite :TestVisit]
       :module :test)
  (use :ngscheurich/edeex.nvim
       :requires [:nvim-treesitter/nvim-treesitter]
       :config "require('edeex').setup({mapping = '<C-c>e'})")
  (use :tpope/vim-abolish)
  (use :tpope/vim-eunuch)
  (use :tpope/vim-rsi)
  (use :tpope/vim-sleuth)
  (use :tpope/vim-unimpaired))


;; TODO: Packer floating window

(packer.startup startup)
