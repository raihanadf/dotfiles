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
  use {'neovim/nvim-lspconfig'}
  use 'williamboman/nvim-lsp-installer'
  use {'wbthomason/packer.nvim'}
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
end)
--------------------------------------------------


----------------- plugins setup -----------------
require("lualine.evil")
require("bufferline").setup()
--------------------------------------------------

----------------- custom setup -----------------
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
local opts = {}
if server.name == "sumneko_lua" then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
        }
      }
    }
  end
server:setup(opts)
end)
--------------------------------------------------

