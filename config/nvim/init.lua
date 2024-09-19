-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
require('lazy').setup({

  -- {
  --   "askfiy/visual_studio_code",
  --   priority = 100,
  --   lazy = false,
  --   config = function()
  --     vim.cmd.colorscheme "visual_studio_code"
  --   end,
  -- },

  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   config = function()
  --     vim.opt.background = "dark" -- set this to dark or light
  --     vim.cmd.colorscheme "oxocarbon"
  --   end,
  -- },

  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      require('onedark').setup {
          style = 'darker'
      }
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.cmd([[colorscheme onedark]])
    end,
  },

  { import = 'plugins' },
  { import = 'lsp' },
}, {})

require 'keybindings'
require 'options'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
