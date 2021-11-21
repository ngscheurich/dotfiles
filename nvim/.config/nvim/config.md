---
title: Neovim Configuration
author: N. G. Scheurich
email: nick@scheurich.haus
url: https://github.com/ngscheurich/dotfiles/nvim
---

# Contents

- [Prelude](#Prelude)
- [Initialization](#Initialization)
  - [Behavior](#Initialization#Behavior)
  - [Providers](#Initialization#Providers)
  - [Globals](#Initialization#Globals)
- [Package Management](#Package Management)
  - [A Brief Note on Terminology](#Package Management#A Brief Note on Terminology)
  - [Package Manager](#Package Management#Package Manager)
- [Text Editing](#Text Editing)
  - [Indentation](#Text Editing#Indentation)
  - [Search and Replace](#Text Editing#Search and Replace)
  - [Yanking](#Text Editing#Yanking)
  - [Supplements](#Text Editing#Supplements)
- [User Interface](#User Interface)
  - [Colors](#User Interface#Colors)
  - [Line Numbers](#User Interface#Line Numbers)
  - [Windows](#User Interface#Windows)
    - [Splitting](#User Interface#Windows#Splitting)
    - [Navigating](#User Interface#Windows#Navigating)
    - [Resizing](#User Interface#Windows#Resizing)
  - [Whitespace](#User Interface#Whitespace)
  - [Signs](#User Interface#Signs)
  - [Indentation](#User Interface#Indentation)
  - [TODO](#User Interface#TODO)
- [Programming](#Programming)
  - [Languages](#Programming#Languages)
    - [Elixir](#Programming#Languages#Elixir)
    - [Erlang](#Programming#Languages#Erlang)
    - [GDScript](#Programming#Languages#GDScript)
    - [GraphQL](#Programming#Languages#GraphQL)
    - [HTML](#Programming#Languages#HTML)
    - [JavaScript/JSX](#Programming#Languages#JavaScript/JSX)
    - [Lua](#Programming#Languages#Lua)
    - [Markdown](#Programming#Languages#Markdown)
    - [Rust](#Programming#Languages#Rust)
    - [Terraform](#Programming#Languages#Terraform)
    - [Tmux](#Programming#Languages#Tmux)
    - [TOML](#Programming#Languages#TOML)
    - [TypeScript](#Programming#Languages#TypeScript)
  - [Language Server Client](#Programming#Language Server Client)
  - [Tree-sitter](#Programming#Tree-sitter)
  - [Formatting](#Programming#Formatting)
  - [Testing](#Programming#Testing)
- [Navigation](#Navigation)
  - [Telescope](#Navigation#Telescope)
- [Completion](#Completion)
  - [In-buffer Completion](#Completion#In-buffer Completion)
  - [Command-line Completion](#Completion#Command-line Completion)
- [Abbreviations](#Abbreviations)
  - [Insert Mode](#Abbreviations#Insert Mode)
  - [Command-line Mode](#Abbreviations#Command-line Mode)
- [Notes and Prose](#Notes and Prose)
- [TODO](#TODO)
  - [Interface](#TODO#Interface)
  - [Notes and prose](#TODO#Notes and prose)
  - [Navigation](#TODO#Navigation)
  - [Code intelligence](#TODO#Code intelligence)
  - [Tools](#TODO#Tools)
  - [Miscellaneous](#TODO#Miscellaneous)

# Prelude 

This is my **Neovim** configuration. This file is a [Markdown] document written in a [literate programming] style, with text meant for computer interpretation, i.e. _code_, intermingled with plain-language text meant to be parsed by humans. I find that this paradigm lends itself nicely to system configuration, as it allows me to colocate my thoughts about parts of the config along with the [Lua] configuration code itself. Hopefully this colocation will make the myriad functions of this file easier to find and parse by others, my future self included.

From a technical perspective, I use the excellent [md-tangle] program to _tangle_, or extract, the source code blocks from this file into Lua files in the standard Neovim configuration directory. Thus, it is not necessary to set up any special tooling to make Neovim work with this configuration system.

TODO: Why Vim?

TODO: Insert note about "Vim" vs "Neovim" (terminology)

# Initialization

## Behavior

For starters, I set some options that control Neovim’s behavior:

- `hidden` to hide abandoned buffers rather than unload them
- `showmode` to prevent the mode from being displayed in the echo area (I prefer to indicate this in the status line)
- `shortmess` to suppress `ins-completion-menu` messages, e.g. “Match 1 of 2”
- `undofile` to persist undo history between sessions by automatically writing to and reading from the `undodir`
- `updatetime` to set the number of milliseconds after which to trigger the `CursorHold` event
- `swapfile` to disable the creation of swapfiles

```lua tangle:plugin/options.lua
vim.opt.hidden     = true
vim.opt.showmode   = false
vim.opt.shortmess  = vim.opt.shortmess + "c"
vim.opt.undofile   = true
vim.opt.updatetime = 1000
vim.opt.swapfile   = false
```

## Providers

Neovim supports dynamic _providers_—integrations with external tools to support features such as `remote-plugin`s. I don’t personally rely on any functionality that these mechanisms provide, so I disable them.

```lua tangle:plugin/providers.lua
vim.g.loaded_python_provider  = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_node_provider    = 0
vim.g.loaded_perl_provider    = 0
```

## Globals

```lua tangle:init.lua
_G.ngs = {
  lsp  = {},
  util = {},
}
```

# Package Management

## A Brief Note on Terminology

While sets of files that modify Vim’s behavior are known colloquially as _plugins_, the term “plugin” in the context of Vim has a specific and often incongruous meaning:

> A plugin is nothing more than a Vim script file that is loaded automatically when Vim starts.

This means that what is often referred to as a _plugin_ is better described as a _package_:

> A Vim package is a directory that contains one or more plugins.

I find that when discussing or reading about Vim packages in the community, they are referred to as _plugins_ far more often than _packages_. Because the alternate usage of “plugin” to describe a package is so prevelant, I thought it worth noting.

Hereafter, I will refer to _packages_ and _plugins_ as defined in Vim’s documnetation (`:h package` and `:h plugin`, respectively), though I’ve not encountered any significant ambiguity in practice when dealing with either term.

## Package Manager

I use [packer.nvim] to manage packages in a declarative style reminiscent of, and inspired by, [use-package]. The following code downloads the package if it doesn’t exist, then gets it ready for use throughout the rest of the file.

```lua tangle:plugin/packages.lua
local bootstrap = nil
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(packer_path)) == 1 then
  local packer_url = "https://github.com/wbthomason/packer.nvim"
  bootstrap = vim.fn.system({"git", "clone", "--depth", "1", packer_url, packer_path})
end

local packer = require("packer")
local use = packer.use

packer.init()

use "wbthomason/packer.nvim"
```

# Text Editing

Vim’s text editing capabilities are one of its strongest characteristics and are core to the Vim experience.

## Indentation

Is use the following options to control how indentation works:

- `expandtab` indents using `<Space>`s rather than `<Tab>`s
- `tabstop` is the number of `<Space>`s that a `<Tab>` counts for in the file
- `softtabstop` is the number of `<Space>`s that a `<Tab>` counts for when editing
- `smartindent` performs autotomatic indentation when starting a new line
- `shiftwidth` is the number of `<Space>`s to use for automatic indentation

```lua tangle:plugin/options.lua
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
```

## Search and Replace

```lua tangle:plugin/options.lua
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
```

## Yanking

```lua tangle:plugin/mappings.lua
vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true})
```

```lua tangle:plugin/autocmds.lua
vim.cmd [[
  augroup yank 
    autocmd!
    autocmd! TextYankPost * lua vim.highlight.on_yank()
  augroup END
]]
```

## Supplements

[vim-easy-align] adds commands to align a block of text around a shared delimiter, e.g. `=`, `:` . I set the mapping `ga` in Normal and Visual mode to invoke the `EasyAlign` command, which waits for the user to press the desired delimiter character. This means that `gaip=` will align around `=` for the `i` nner `p` aragraph.

```lua tangle:plugin/packages.lua
use {
  "junegunn/vim-easy-align",
  config = function ()
    -- TODO: This doesn't actually work. Why?
    vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", {})
    vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {})
  end,
}
```

TODO:

```lua tangle:plugin/packages.lua
-- TODO: Maybe hop?
use "justinmk/vim-sneak"
-- TODO: Does this belong under Search/Replace
use "tpope/vim-abolish"
-- TODO: Check newer alternatives
use "tpope/vim-commentary"
-- TODO: Does this go here?
use "tpope/vim-repeat"
use "tpope/vim-sleuth"
use "tpope/vim-speeddating"
use "tpope/vim-surround"
use "tpope/vim-unimpaired"
use "windwp/nvim-autopairs"
```

# User Interface

## Colors

Many modern terminal emulators support 24-bit RGB color, including my current emulator of choice, [kitty]. In order to enable this color spectrum in Neovim's `TUI` (terminal UI), `termguicolors` must be set.

```lua tangle:plugin/options.lua
vim.opt.termguicolors = true
```

My colorscheme of choice is [Tokyo Night], a Lua port of the [Visual Studio Code theme] of the same name by the prolific [Folke Lemaitre]. I use the _night_ variant.

```lua tangle:plugin/packages.lua
use {
  "folke/tokyonight.nvim",
  setup = function () vim.g.tokyonight_style = "night" end,
  config = function () vim.cmd [[colorscheme tokyonight]] end,
}
```

## Line Numbers

Annotating each line in a file with its corresponding line number is quite useful. Showing _relative_ line numbers is essential to me for efficient buffer navigation and text editing.

```lua tangle:plugin/options.lua
vim.opt.number = true
vim.opt.relativenumber = true
```

## Windows

In Vim, a _window_ is a viewport on a buffer. A collection of windows is referred to a a _tab page_, of which there can exist one or many—though only one may be visible at any given time. Splitting, resizing, and moving between windows is an integral part of my workflow.

### Splitting

By default, horizontal splits are created above the current window and vertical splits to the left of the current window. I find this counter-intuitive so I reverse it, i.e. set horizontal splits to open below and vertical splits to the right.

```lua tangle:plugin/options.lua
vim.opt.splitbelow = true
vim.opt.splitright = true
```

### Navigating

Since the arrow keys aren’t necessary for line-wise or character-wise cursor movement in Neovim, I repurpose them for window navigation. Since I bind `Caps Lock` to `Ctrl` (when pressed with another key), and `Ctrl` + `h`/`j`/`k`/`l` to the arrow keys, window navigation commands are quite easy to access.

```lua tangle:plugin/mappings.lua
vim.api.nvim_set_keymap("n", "<Left>",  "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<Down>",  "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<Up>",    "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<Right>", "<C-w>h", {noremap = true})
```

### Resizing

```lua tangle:plugin/mappings.lua
```

## Whitespace

Neovim has a feature, `listmode`, that displays whitespace characters, e.g. end of line, trailing spaces, tabs. I don’t use this mode for day-to-day editing but it can be really useful in certain situations, especially if you suspect that there are hidden characters interfering with some operation.

The `listchars` option can be set to a table that maps each whitespace character to how it should appear when `listmode` is enabled.

```lua tangle:plugin/options.lua
vim.opt.listchars = {
  tab      = ">-",
  eol      = "↵",
  nbsp     = "␣",
  trail    = "‧",
  extends  = "⟩",
  precedes = "⟨",
}
```

## Signs

```lua tangle:plugin/options.lua
vim.opt.signcolumn = "yes"
```

```lua tangle:plugin/signs.lua
vim.fn.sign_define("LspDiagnosticsSignError",       {text = ""})
vim.fn.sign_define("LspDiagnosticsSignWarning",     {text = ""})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignHint",        {text = ""})
```

## Indentation

When working in a deeply indented file, drawing connections between indentation levels can be a useful visual aid; the [Indent Blankline] package does this job nicely. I don’t enable it on load but keep it a quick mapping away.

```lua tangle:plugin/packages.lua
use {
  "lukas-reineke/indent-blankline.nvim",
  cmd = "IndentBlanklineToggle",
  init = function ()
    vim.g.indent_blankline_enabled = false
    vim.g.indent_blankline_use_treesitter = true
    vim.g.indent_blankline_char = "│"
  end,
  config = function ()
    vim.api.nvim_set_keymap("n", "<Leader>ui",  "<Cmd>IndentBlanklineToggle<CR>", {noremap = true})
  end,
}
```

## TODO

```lua tangle:plugin/packages.lua
use {
  {"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim"},
  "folke/trouble.nvim",
  -- TODO: Bring back galaxyline?
  "hoob3rt/lualine.nvim",
  "kyazdani42/nvim-tree.lua",
  -- TODO: Check out nonicons
  "kyazdani42/nvim-web-devicons",
  {"lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim"},
  {"liuchengxu/vista.vim", cmd = "Vista"},
  -- TODO: Look at dashboard or the Lua clone
  "mhinz/vim-startify",
  "norcalli/nvim-colorizer.lua",
  "nvim-lua/lsp-status.nvim",
  -- TODO: I think this can be done with nvim-cmp now
  "onsails/lspkind-nvim",
  "rktjmp/lush.nvim",
  -- TODO: Do I need this?
  "romainl/vim-qf",
  {"voldikss/vim-floaterm"},
}
```

# Programming

## Languages

### Elixir

```lua tangle:plugin/packages.lua
use {
  "elixir-editors/vim-elixir",
  config = function ()
    table.insert(ngs.lsp, function (servers, cfg)
      servers.elixirls.setup(
        vim.tbl_extend("force", cfg, {
          cmd = {"/usr/local/opt/elixir-ls/language_server.sh"},
          settings = {elixirLS = {fetchDeps = false}},
        })
      )
    end)
  end
}

use {
  "ngscheurich/edeex.nvim",
  config = function ()
    require("edeex").setup({mapping = "<C-c>e"})
  end
}
```

### Erlang

Set the `filetype` to `erlang` for [leex] and [yecc] files.

```vim tangle:ftdetect/leex.vim
autocmd BufNewFile,BufRead *.xrl set filetype=erlang
```

```vim tangle:ftdetect/yecc.vim
autocmd BufNewFile,BufRead *.yrl set filetype=erlang
```

### GDScript

```lua tangle:plugin/packages.lua
use {
  "calviken/vim-gdscript3",
  config = function ()
    table.insert(ngs.lsp, function (servers, cfg)
      servers.gdscript.setup(cfg)
    end)
  end
}
```

### GraphQL

```lua tangle:plugin/packages.lua
use "jparise/vim-graphql"
```

### HTML

```lua tangle:plugin/packages.lua
use "othree/html5.vim"
```

### JavaScript/JSX

```lua tangle:plugin/packages.lua
use "pangloss/vim-javascript"
use "MaxMEllon/vim-jsx-pretty"
```

### Lua

```lua tangle:plugin/packages.lua
use {
  "euclidianAce/BetterLua.vim",
  config = function ()
    table.insert(ngs.lsp, function (servers, cfg)
      local lua_root = "/usr/local/opt/lua-language-server"
      local lua_bin = lua_root .. "/bin/macOS/lua-language-server"
      local lua_main = lua_root .. "/main.lua"

      local runtime_path = vim.split(package.path, ';')
      table.insert(runtime_path, "lua/?.lua")
      table.insert(runtime_path, "lua/?/init.lua")

      servers.sumneko_lua.setup(
        vim.tbl_extend("force", cfg, {
          cmd = {lua_bin, "-E", lua_main},
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
                path = runtime_path,
              },
              diagnostics = {
                globals = {"vim", "ngs"}
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                preloadFileSize = 250,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        })
      )
    end)
  end,
}
```

```lua tangle:ftplugin/lua.lua
vim.opt_local.shiftwidth  = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop     = 2
```

### Markdown

```lua tangle:plugin/packages.lua
use {
  "plasticboy/vim-markdown",
  setup = function ()
    vim.g.vim_markdown_folding_disabled = 1
  end,
}

use {
  "iamcco/markdown-preview.nvim",
  run = "cd app && yarn install"
}
```

### Rust

```lua tangle:plugin/packages.lua
use "rust-lang/rust.vim"
```

### Terraform

```lua tangle:plugin/packages.lua
use "hashivim/vim-terraform"
```

### Tmux

```lua tangle:plugin/packages.lua
use "ericpruitt/tmux.vim"
```

### TOML

```lua tangle:plugin/packages.lua
use "cespare/vim-toml"
```

### TypeScript

```lua tangle:plugin/packages.lua
use "HerringtonDarkholme/yats.vim"
```

## Language Server Client

```lua tangle:plugin/packages.lua
use {
  "neovim/nvim-lspconfig",
  config = function ()
    local servers = require("lspconfig")

    -- Function to run on client attach
    local function on_attach(_, bufnr)
      local function map(lhs, rhs)
          vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, rhs, {noremap = true, silent = true})
      end

      map("<C-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>")
      map("K",     "<Cmd>lua vim.lsp.buf.hover()<CR>")
      map("[d",    "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
      map("]d",    "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>")

      map("<Leader>la", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
      map("<Leader>ld", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
      map("<Leader>lf", "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>")
      map("<Leader>lR", "<Cmd>lua vim.lsp.buf.rename()<CR>")
      map("<Leader>lr", "<Cmd>lua require('telescope.builtin').lsp_references()<CR>")
      map("<Leader>ls", "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
      map("<Leader>lt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>")
    end

    -- Shared server config
    local config = {
      on_attach = on_attach,
      capabilities = require("cmp_nvim_lsp").update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
    }

    -- Set up servers
    for _, callback in ipairs(ngs.lsp) do
      callback(servers, config)
    end
  end,
}
```

## Tree-sitter

```lua tangle:plugin/packages.lua
use {
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
  "nvim-treesitter/playground",
}
```

## Formatting

```lua tangle:plugin/packages.lua
use {
  "mhartington/formatter.nvim",
  config = function ()
    local prettier = function ()
      return {
        exe = "npx",
        args = {"prettier", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
        stdin = true,
      }
    end

    local black = function ()
      return {
        exe = "black",
        args = {"-"},
        stdin = true,
      }
    end

    local stylelint = function ()
      return {
        exe = "npx",
        args = {"stylelint", "--fix"},
        stdin = true,
      }
    end

    require("formatter").setup({
      css        = {prettier, stylelint},
      html       = {prettier},
      javascript = {prettier},
      python     = {black},
      typescript = {prettier},
    })

    vim.cmd [[
      augroup autoformat
        autocmd!
        autocmd BufWritePost *.css,*.html,*.js,*.py,*.ts,*.tsx FormatWrite
      augroup END
    ]]
  end,
}
```

## Testing

```lua tangle:plugin/packages.lua
-- TODO: Check out ult-test
use {
  "vim-test/vim-test",
  cmd = {"TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit"},
  config = function ()
    vim.g["test#strategy"] = "floaterm"
  end,
}
```

# Navigation

## Telescope

[telescope.nvim] is a modern, extensible fuzzy finder created by [TJ DeVries], a Neovim core contributor. It operates over lists from a variety of built-in and community-created sources and makes creating new sources a simple task. I use it for things like:

- Finding files
- Switching buffers
- Viewing LSP results
- Previewing documentation

It requires two packages, [plenary.nvim] and [popup.nvim], both also created by TJ.

```lua tangle:plugin/packages.lua
use {
  "nvim-telescope/telescope.nvim",
  requires = {{"nvim-lua/plenary.nvim"}, {"nvim-lua/popup.nvim"}}
}
```

```lua tangle:plugin/packages.lua
use {
  "nvim-telescope/telescope-fzy-native.nvim",
  run = "git submodule init && git submodule update",
  config = function()
    require("telescope").load_extension("fzy_native")
  end
}
```

# Completion

Having computer programs try to complete what you are typing is a great timesaver and safeguard against typos or invalid commands. I’ve also found this type of completion to be useful when exploring what commands are available at any given time.

In Vim, there are two contexts in which such a completion mechanism must be considered: when a user is adding content directly to the buffer, namely in Insert or Replace mode, and when they are interacting with the command-line in Command-line mode.

## In-buffer Completion

Vim offers a robust in-buffer completion system out of the box. It can complete candidates drawn from the current file, tags, the `dictionary`, and more. See `:h ins-completion` for a full list. It’s worth familiarizing oneself with this system before reaching for an external completion package, as it can still be useful in many situations and is a core component of Vim.

That being said, I do make use of a popular completion package: [nvim-cmp]. When compared to the built-in completion system it offers a more useful UI, fully integrates with Neovim’s built-in LSP client, and supports a broader list of completion sources.
I use the following sources for to generate completion candidates for nvim-cmp:

- [cmp-nvim-lsp] for the built-in LSP client
- [cmp-nvim-lua] for Neovim’s Lua API
- [cmp-buffer] for words in the buffers
- [cmp-path] for filesystem paths
- [cmp_luasnip] for snippets (user-defined and from the LSP client)

Snippets is a topic all its own, but it should be noted that a snippet engine is required for nvim-cmp to work properly. I use [LuaSnip].

``` lua tangle:plugin/packages.lua
use {
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
}
```

TODO: Write about nvim-cmp setup

``` lua tangle:plugin/packages.lua
use {
  "hrsh7th/nvim-cmp",
  config = function ()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function (args)
          require("luasnip").lsp_expand(args.body)
        end
      },
      mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
      })
    })
  end
}
```

## Command-line Completion

TODO: Write about `wildmenu`

# Abbreviations

## Insert Mode

```vim tangle:plugin/abbrevs.vim
iabbrev facilty facility
iabbrev changset changeset
iabbrev InfieldPro InFieldPro
```

## Command-line Mode

```vim tangle:plugin/abbrevs.vim
cabbrev Qa qa
cabbrev Xa xa
```

# Notes and Prose

```lua tangle:plugin/packages.lua
use {
  "vimwiki/vimwiki",
  setup = function ()
    vim.g.vimwiki_list = {{
      path = "~/Dropbox/Notes",
      syntax = "markdown",
      ext = ".md",
    }}
  end
}
```

---

# TODO

## Interface

## Notes and prose

```lua tangle:plugin/packages.lua
use {
  -- TODO: I believe there is a Lua/TS alternative
  {"junegunn/limelight.vim", cmd = "Limelight"},
  -- TODO: Replace with zen-mode.nvim
  {"junegunn/goyo.vim", cmd = "Goyo"},
  {"reedes/vim-pencil", cmd = {"Pencil", "PencilToggle"}},
}
```

## Navigation


```lua tangle:plugin/packages.lua
use {
  "andymass/vim-matchup",
  "justinmk/vim-dirvish",
  "tpope/vim-projectionist",
  -- TODO: Move to Telescope section
}
```


## Code intelligence

## Tools

```lua tangle:plugin/packages.lua
use {
  -- TODO: Check out alternatives
  {"dstein64/vim-startuptime", opt = true},
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-rsi",
}
```

## Miscellaneous

```lua tangle:plugin/packages.lua
```

---

```lua tangle:plugin/packages.lua
if bootstrap then
  packer.sync()
end
```

[Markdown]: https://daringfireball.net/projects/markdown/
[literate programming]: https://en.wikipedia.org/wiki/Literate_programming
[Lua]: https://www.lua.org/
[md-tangle]: https://pypi.org/project/md-tangle/
[packer.nvim]: https://github.com/wbthomason/packer.nvim
[use-package]: https://github.com/jwiegley/use-package
[kitty]: https://sw.kovidgoyal.net/kitty/
[Tokyo Night]: https://github.com/folke/tokyonight.nvim/
[Folke Lemaitre]: http://folke.io/
[Visual Studio Code theme]: https://github.com/enkia/tokyo-night-vscode-theme
[Indent BlankLine]: https://github.com/lukas-reineke/indent-blankline.nvim
[telescope.nvim]: https://github.com/nvim-telescope/telescope.nvim
[TJ DeVries]: https://github.com/tjdevries/
[plenary.nvim]: https://github.com/nvim-lua/plenary.nvim
[popup.nvim]: https://github.com/nvim-lua/popup.nvim
[nvim-cmp]: https://github.com/hrsh7th/nvim-cmp
[cmp-nvim-lsp]: https://github.com/hrsh7th/cmp-nvim-lsp
[cmp-nvim-lua]: https://github.com/hrsh7th/cmp-nvim-lua
[cmp-buffer]: https://github.com/hrsh7th/cmp-buffer
[cmp-path]: https://github.com/hrsh7th/cmp-path
[cmp_luasnip]: https://github.com/saadparwaiz1/cmp_luasnip
