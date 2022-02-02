----------------- packer startup -----------------
require('packer').startup(function()
  use {'nvim-treesitter/nvim-treesitter', config = function()
        local configs = require'nvim-treesitter.configs'
        configs.setup {
        ensure_installed = "maintained", -- Only use parsers that are maintained
        highlight = { -- enable highlighting
          enable = true,
        },
        indent = {
          enable = false, -- default is disabled anyways
        }
        }
        -- folding
        --vim.opt.foldmethod = "expr"
        --vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        end
  }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'wbthomason/packer.nvim'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}
  use 'aonemd/kuroi.vim'
  use "rebelot/kanagawa.nvim"
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
  use {'windwp/nvim-autopairs', config = function ()
          -- If you want insert `(` after select function or method item
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

        -- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
        cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
  end}
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'kyazdani42/nvim-tree.lua',
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
-------------------------------------------------
require("bufferline").setup()
require("luasnip.loaders.from_vscode").load()
require('nvim-autopairs').setup{}
require('nvim_comment').setup()
require("indent_blankline").setup { show_end_of_line = true, }
require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules" }} }
--------------------------------------------------
