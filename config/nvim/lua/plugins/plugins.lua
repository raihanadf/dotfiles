local fn = vim.fn

-- langsung install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- reload tiap save ntar disync
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- protected call biar aman ngab
local ok, packer = pcall(require, "packer")
if not ok then
  vim.notify("lol packernya gabisa")
  return
end

-- pake popup window instead
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- plugins disini
return packer.startup(function(use)
  ----------------------- general plugins ---------------------------
  use("wbthomason/packer.nvim") -- packer itself
  use("lewis6991/impatient.nvim")
  use({ "nvim-lua/plenary.nvim", event = "BufWinEnter" }) -- stdlib
  use("nvim-lua/popup.nvim") -- popup api
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    module = "nvim-treesitter",
    event = "BufRead",
    cmd = 'require("plugins.commands").treesitter',
    config = "require('plugins.settings.treesitter')",
  }) -- syntax highlighting
  use({ "declancm/cinnamon.nvim", event = "BufWinEnter", config = "require('plugins.settings.cinnamon')" }) -- smooth scrolling cuy
  use({ "terrortylor/nvim-comment", event = "BufWinEnter", config = "require('plugins.settings.comment')" }) -- nvim comment
  use({ "windwp/nvim-autopairs", config = "require('plugins.settings.autopairs')", after = "nvim-cmp" }) -- autopairs
  use({ "norcalli/nvim-colorizer.lua", config = "require('plugins.settings.colorizer')", event = { "UIEnter" } }) -- colorizer
  use({ "stevearc/dressing.nvim", event = "UIEnter" })
  -- core ^

  use({ "kyazdani42/nvim-web-devicons", event = "UIEnter", config = "require('plugins.settings.devicons')" })
  use({
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    event = "UIEnter",
    config = "require('plugins.settings.bufferline')",
  })
  use({ "mrjones2014/smart-splits.nvim", event = "UIEnter" }) -- buat ngesplit sama resize mantap
  use({ "moll/vim-bbye", event = "UIEnter" }) -- bye bye buffer, biar gak ikutan keclose yg laen
  use({
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    cmd = {
      "Alpha",
      "AlphaRedraw",
    },
    event = "BufWinEnter",
    config = "require('plugins.settings.alpha')",
  }) -- fancy startup
  use({ "nvim-tree/nvim-tree.lua", cmd = "NvimTreeToggle", config = "require('plugins.settings.nvim-tree')" }) -- nvim treeee
  use({ "akinsho/toggleterm.nvim", config = "require('plugins.settings.toggleterm')", event = "BufWinEnter" }) -- toggle term
  use({
    "nvim-telescope/telescope.nvim",
    config = "require('plugins.settings.telescope')",
    module = "telescope",
  }) -- telescopeeeee
  use({ "lukas-reineke/indent-blankline.nvim", event = "BufWinEnter" }) -- indenting line
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufWinEnter",
    ft = "gitcommit",
    config = "require('plugins.settings.gitsigns')",
  }) -- git signs
  -- ui ^

  use({ "andweeb/presence.nvim", event = { "UIEnter" }, config = "require('plugins.settings.presence')" }) -- pamer neovim di discord
  -- misc ^
  -------------------------------------------------------------------

  ------------------------ lsp and something ------------------------
  use({ "williamboman/mason.nvim", config = "require('core.lsp.mason')" })
  use({
    "neovim/nvim-lspconfig",
    opt = true,
    config = "require('core.lsp.lspconfig')",
    event = "BufEnter",
  })

  -- luasnip
  use({ "L3MON4D3/LuaSnip", after = "nvim-cmp", config = "require('core.lsp.luasnip')" })
  use({ "rafamadriz/friendly-snippets", event = "InsertEnter" })
  use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })

  -- cmp
  use({ "hrsh7th/nvim-cmp", after = "friendly-snippets", config = "require('core.lsp.cmp')" })
  use({ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" })
  use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
  use({ "hrsh7th/cmp-cmdline", after = "cmp-nvim-lsp" })

  -- dap
  use({ "mfussenegger/nvim-dap", event = "BufWinEnter", after = "nvim-lspconfig" })
  use({ "folke/trouble.nvim", event = "BufWinEnter", after = "nvim-lspconfig" }) -- trouble diagnostic

  -- something
  use({
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufWinEnter",
    after = "nvim-lspconfig",
    config = "require('core.lsp.null-ls')",
  })
  use({ "RRethy/vim-illuminate", event = "BufWinEnter", after = "nvim-lspconfig" })

  -- external language specific lsp
  use({ "akinsho/flutter-tools.nvim" })
  -------------------------------------------------------------------

  -- automatis setup config abis clone packer.nvim
  -- taroh paling bawah
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
