----------------- packer startup -----------------
require('packer').startup(function()
  -- packer
  use 'wbthomason/packer.nvim'

  -- general
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use 'aonemd/kuroi.vim'
  use "rebelot/kanagawa.nvim"
  use 'eddyekofo94/gruvbox-flat.nvim'
  use 'Shatur/neovim-ayu'

  -- lsp
  use {'nvim-treesitter/nvim-treesitter', config = require('plugins.treesitter')}
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- luasnip
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"

  -- autopairs
  use {'windwp/nvim-autopairs', config = require('plugins.nvimautopairs')}
  use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
  use {'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }
  use "terrortylor/nvim-comment"
  use "lukas-reineke/indent-blankline.nvim"

end)
--------------------------------------------------

----------------- plugins setup -----------------

--imports
require("plugins.lsp")
require('plugins.nvimtree')
require("plugins.evil")

--basic setup
require("bufferline").setup()
require("luasnip.loaders.from_vscode").load()
require('nvim-autopairs').setup{}
require('nvim_comment').setup()
require("indent_blankline").setup { show_end_of_line = true, }
require('telescope').setup{ defaults = { file_ignore_patterns = { "node_modules" }} }
--------------------------------------------------
