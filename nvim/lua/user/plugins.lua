local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    -- open_fn = function()
    --   return require("packer.util").float { border = "rounded" }
    -- end,
  },
}


--  useage
-- use {
--   "myusername/example",        -- The plugin location string
--   -- The following keys are all optional
--   disable = boolean,           -- Mark a plugin as inactive
--   as = string,                 -- Specifies an alias under which to install the plugin
--   installer = function,        -- Specifies custom installer. See "custom installers" below.
--   updater = function,          -- Specifies custom updater. See "custom installers" below.
--   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--   rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
--   opt = boolean,               -- Manually marks a plugin as optional.
--   branch = string,             -- Specifies a git branch to use
--   tag = string,                -- Specifies a git tag to use. Supports "*" for "latest tag"
--   commit = string,             -- Specifies a git commit to use
--   lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
--   run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
--   requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
--   rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
--   config = string or function, -- Specifies code to run after this plugin is loaded.
--   -- The setup key implies opt = true
--   setup = string or function,  -- Specifies code to run before this plugin is loaded.
--   -- The following keys all imply lazy-loading and imply opt = true
--   cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
--   ft = string or list,         -- Specifies filetypes which load this plugin.
--   keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
--   event = string or list,      -- Specifies autocommand events which load this plugin.
--   fn = string or list          -- Specifies functions which load this plugin.
--   cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
--   module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
--                                -- with one of these module names, the plugin will be loaded.
--   module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
--   requiring a string which matches one of these patterns, the plugin will be loaded.
-- }

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim"                       -- package manager

  -- [[ Startup ]]
  use "lewis6991/impatient.nvim"                     -- speed up loading Lua modules
  use "nvim-lua/popup.nvim"                          -- popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                        -- useful lua functions used by lots of plugins
  use "rcarriga/nvim-notify"                         -- notify
  use "kyazdani42/nvim-web-devicons"                 -- icons

  -- [[ Theme ]]
  use { 'mhinz/vim-startify' }                       -- start screen
  use { 'DanilaMihailov/beacon.nvim' }               -- cursor jump
  use {
    'nvim-lualine/lualine.nvim',                     -- statusline
    requires = {'kyazdani42/nvim-web-devicons',
                opt = true}
  }
  use { 'Mofiqul/dracula.nvim' }                     -- colorscheme

  -- [[ File Brower ]]
  use {
    'kyazdani42/nvim-tree.lua',                      -- filesystem navigation
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use { 'mbbill/undotree' }                          -- undo history

  -- [[ Auto Completion ]]
  use "hrsh7th/nvim-cmp"                             -- The completion plugin
  use "hrsh7th/cmp-nvim-lsp"                         -- lsp completions
  use "hrsh7th/cmp-buffer"                           -- buffer completions
  use "hrsh7th/cmp-path"                             -- path completions
  use "hrsh7th/cmp-cmdline"                          -- cmdline completions
  use "hrsh7th/cmp-nvim-lua"

  use "saadparwaiz1/cmp_luasnip"                     -- snippet completions
  use "L3MON4D3/LuaSnip"                             -- snippet engine
  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"                 -- a bunch of snippets to use

  use 'onsails/lspkind-nvim'                         -- vscode-like pictograms for completion items

  use {
    'nvim-telescope/telescope.nvim',                 -- fuzzy finder
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "nvim-telescope/telescope-live-grep-args.nvim"
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  -- use {
  --   "nvim-telescope/telescope-frecency.nvim",
  --   requires = {"tami5/sqlite.lua"}   -- NOTE: need to install sqlite lib
  -- }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-rg.nvim"
  use "MattesGroeger/vim-bookmarks"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-dap.nvim"

  use { 'majutsushi/tagbar' }                        -- code structure

  -- [[ Git ]]
  use { 'tpope/vim-fugitive' }                       -- git integration
  use { 'junegunn/gv.vim' }                          -- commit history

  -- [[ Terminal ]]
  use { 'voldikss/vim-floaterm' }                    -- floating/popup window

  -- Treesittetr
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    commit = "44b7c8100269161e20d585f24bce322f6dcdf8d2",
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    commit = "c81382328ad47c154261d1528d7c921acad5eae5",
  } -- enhance texetobject selection
  use "romgrk/nvim-treesitter-context" -- show class/function at the top
  -- -- use "m-demare/hlargs.nvim"
  -- -- use "SmiteshP/nvim-gps" -- statusline shows class structure
  -- use "andymass/vim-matchup"
  -- use {
  --   "abecodes/tabout.nvim",
  --   wants = { 'vim-treesitter' }, -- or require if not used so far
  -- }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  -- use "RishabhRD/popfix"
  -- use "RishabhRD/nvim-lsputils"
  use "kosayoda/nvim-lightbulb" -- code action
  use "ray-x/lsp_signature.nvim" -- show function signature when typing
  -- use {
  --   "ray-x/guihua.lua",
  --   run = 'cd lua/fzy && make'
  -- }
  -- use { 'ray-x/navigator.lua' } -- super powerful plugin  for code navigation

  --  [[ Editor Enhance ]]
  use "tpope/vim-surround"                           -- vim surround
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use { "terrortylor/nvim-comment" }                 -- toggle comments
  use "Shatur/neovim-session-manager"

  -- use "quangnguyen30192/cmp-nvim-tags"
  -- use "jsfaint/gen_tags.vim"
  -- use "ray-x/cmp-treesitter"
  -- use "f3fora/cmp-spell" -- spell check
  -- use "github/copilot.vim"  -- Copilot setup,
  -- use {
  --   "tzachar/cmp-tabnine", -- use ":CmpTabnineHub" command to login
  --   after = "nvim-cmp",
  --   run = 'bash ./install.sh',
  -- }
  use "ethanholz/nvim-lastplace" -- auto return back to the last modified positon when open a file
  use "BurntSushi/ripgrep" -- ripgrep
  -- use "nvim-pack/nvim-spectre" -- search and replace pane
  -- use "haringsrob/nvim_context_vt" -- show if, for, function... end as virtual text
  -- use "code-biscuits/nvim-biscuits" -- AST enhance, require treesitter
  use "tpope/vim-repeat" --  . command enhance
  -- use "terryma/vim-expand-region" -- expand/shrink region by +/-
  -- use "meain/vim-printer"

  use "akinsho/toggleterm.nvim" -- toggle terminal
  -- use "ahmedkhalf/project.nvim" -- project manager
  use "lukas-reineke/indent-blankline.nvim" -- indent blankline
  use "folke/which-key.nvim" -- which  key
  use {
    "phaazon/hop.nvim", -- like easymotion, but more powerful
    branch = "v1", -- optional but strongly recommended
  }
  -- use { "rhysd/accelerated-jk", event = "BufReadPost" }
  -- use "famiu/bufdelete.nvim"

  -- use "nathom/filetype.nvim"

  -- Debugger
  if not is_windows_os then
    use "Pocco81/DAPInstall.nvim"                      -- install debug adapter clients, no support for Windows
  end
  use "mfussenegger/nvim-dap"                          -- debug adapter protocol client
  use {                                                -- ui for nvim-dap
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"}
  }
  use "theHamsta/nvim-dap-virtual-text"
  use "mfussenegger/nvim-dap-python"    -- debug python
  -- use { "leoluz/nvim-dap-go", module = "dap-go" } -- debug golang
  use { "jbyuki/one-small-step-for-vimkind", module = "osv" } -- debug any Lua code running in a Neovim instance
  use {
    "sakhnik/nvim-gdb",
    run = "./install.sh"
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    tag = "v0.4",
  }
  use 'sindrets/diffview.nvim'
  -- use "tanvirtin/vgit.nvim"
  -- use "tpope/vim-fugitive"

  -- UI
  -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- use "martinsione/darkplus.nvim"
  -- use "navarasu/onedark.nvim"
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })
  use {
    "projekt0n/github-nvim-theme",
    tag = "v0.0.4",
  }

  -- use "folke/tokyonight.nvim"
  use {
    "akinsho/bufferline.nvim", -- tab
    tag = "v1.2.0",
  }
  -- use "moll/vim-bbye"
  use "goolord/alpha-nvim" -- welcome page
  -- use "startup-nvim/startup.nvim"     -- welcome page

  -- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  -- use {
  --   "kevinhwang91/nvim-hlslens", -- highlight search
  --   disable = true,
  -- }
  use "kevinhwang91/nvim-bqf" -- better quick fix
  use "RRethy/vim-illuminate" -- highlight undercursor word   --  NOTE: 可能造成卡顿
  -- use "lewis6991/spellsitter.nvim" -- spell checker
  use "folke/todo-comments.nvim" -- todo comments
  -- use "liuchengxu/vista.vim"     -- outline
  use "simrat39/symbols-outline.nvim" -- outline
  -- use "stevearc/aerial.nvim"
  use "norcalli/nvim-colorizer.lua" -- show color
  use "folke/trouble.nvim"
  use "j-hui/fidget.nvim" -- show lsp progress
  -- use "sindrets/winshift.nvim" -- rerange window layout
  use "simeji/winresizer"
  -- litee family
  use {
    "ldelossa/litee.nvim",
    commit = "47235cb807a83af866e06ce654b28efcfe347c60"
  }
  use {
    "ldelossa/litee-calltree.nvim",
    commit = "3f3c25e584558949b1eda38ded76eade28fa5fd6"
  }

  -- tools
  -- use "cdelledonne/vim-cmake"
  use "aserowy/tmux.nvim"   -- NOTE: 可能造成卡顿
  use "ravenxrz/neovim-cmake"
  use {
    "skanehira/preview-markdown.vim",
    opt = true,
    cmd = "PreviewMarkdown",
  } -- NOTE:: glow required : https://github.com/charmbracelet/glow
  use "voldikss/vim-translator"
  use "mtdl9/vim-log-highlighting"
  use "Pocco81/HighStr.nvim"
  -- use "dstein64/vim-startuptime"
  use "ravenxrz/vim-local-history"
  -- use "henriquehbr/nvim-startup.lua"
  -- use "AckslD/nvim-neoclip.lua"

  -- [[ TEST ]]
  use { "alepez/vim-gtest" }                         -- select and run GoogleTest
  use "vim-test/vim-test"
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  }
  use {
    "rcarriga/vim-ultest",
    run = ":UpdateRemotePlugins"
  }
  use { 'michaelb/sniprun', run = 'bash ./install.sh' }
  -- use "ravenxrz/DoxygenToolkit.vim"
  use "Pocco81/AutoSave.nvim"
  use "djoshea/vim-autoread"
  -- use "chipsenkbeil/distant.nvim"

  -- [[ WIKI ]]
  use { 'vimwiki/vimwiki' }                          -- a personal wiki

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
