local fn = vim.fn

-- langsung install packer
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

-- reload tiap save ntar disync
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- protected call biar aman ngab
local ok, packer = pcall(require, "packer")
if not ok then
  vim.notify("lol packernya gabisa")
  return
end

-- pake popup window instead
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- plugins disini
return packer.startup(function(use)




  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use({
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup()
    end,
  })
  use({ "mrjones2014/smart-splits.nvim" }) -- buat ngesplit sama resize mantap
  use({ "moll/vim-bbye" }) -- bye bye buffer, biar gak ikutan keclose yg laen
  use({ "andweeb/presence.nvim", })
  use("mfussenegger/nvim-dap")
  -- lsp installer
  use({ "williamboman/mason.nvim", })
  use({ "williamboman/mason-lspconfig.nvim", })
  
  -- cmp
  use("hrsh7th/nvim-cmp")
  use({"hrsh7th/cmp-buffer", })
  use({"hrsh7th/cmp-path", })
  use({"hrsh7th/cmp-cmdline", })
  -- luasnip
  use({ "rafamadriz/friendly-snippets", })
  use({ "L3MON4D3/LuaSnip", })
  use({ "saadparwaiz1/cmp_luasnip", })

  
  -- automatis setup config abis clone packer.nvim
  -- taroh paling bawah
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
