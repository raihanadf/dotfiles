----------------- packer startup -----------------
require('packer').startup(function()
  -- packer
  use 'wbthomason/packer.nvim'

  -- general
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use 'whatsthatsmell/codesmell_dark.vim'
  use 'sainnhe/sonokai'
  use 'karb94/neoscroll.nvim'

  -- lsp
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- git
  use 'lewis6991/gitsigns.nvim'

  -- luasnip
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"

  -- autopairs
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
  use {'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }}
  use "terrortylor/nvim-comment"
  use "lukas-reineke/indent-blankline.nvim"

end)
--------------------------------------------------

----------------- plugins setup -----------------

--imports
require("plugins.lsp")
require 'lspconfig'.intelephense.setup {
      init_options = {
          globalStoragePath = os.getenv('HOME') .. '/.local/share/intelephense'
      }
}
require('plugins.nvimtree')
require('plugins.treesitter')
require("plugins.lua-line")

--basic setup
require("bufferline").setup()
require('neoscroll').setup({
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
})
require("luasnip.loaders.from_vscode").load()
require('nvim-autopairs').setup{}
require('nvim_comment').setup()
require("indent_blankline").setup()
require('telescope').setup{ defaults = { file_ignore_patterns = { "node_modules" }} }
--------------------------------------------------
require('gitsigns').setup()
