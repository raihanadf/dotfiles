-------------------------------------------------------------------
----------------------------- plugins -----------------------------
-------------------------------------------------------------------
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
local packer = require("packer")

if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))

  vim.fn.mkdir(directory, "p")

  local out = vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print(out)
  print("Downloading packer.nvim...")

  return
end

return packer.startup({
  function(use)
    -- Plugin Manager
    use({ "wbthomason/packer.nvim" })

    -- Impatient
    use("lewis6991/impatient.nvim")

    -- stdlib for async stuff
    use({ "nvim-lua/plenary.nvim" })

    -- color schemes
    use("whatsthatsmell/codesmell_dark.vim")

    ----------------------- general plugins ---------------------------
    -- use({
    --   "nvim-lualine/lualine.nvim",
    --   requires = { "kyazdani42/nvim-web-devicons", opt = true },
    --   config = function()
    --     require("configs.ui.lua-lin")
    --   end,
    -- })
    use({
      "akinsho/bufferline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("configs.ui.bufferline")
      end,
    })
    use("karb94/neoscroll.nvim")
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("configs.utils.telescope")
      end,
    })
    use({ "nvim-telescope/telescope-ui-select.nvim" })
    use({
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("configs.ui.nvim-tree")
      end,
    })
    use({
      "terrortylor/nvim-comment",
      config = function()
        require("nvim_comment").setup()
      end,
    })
    use("lukas-reineke/indent-blankline.nvim")
    use({
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("configs.core.treesitter")
      end,
    })
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end,
    })
    use({
      "norcalli/nvim-colorizer.lua",
      event = "BufWinEnter",
      config = function()
        require("configs.ui.colorizer")
      end,
    })
    use({
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup()
      end,
      after = "nvim-cmp",
    })
    use({
      "akinsho/toggleterm.nvim",
      config = function()
        require("configs.ui.toggleterm")
      end,
    })
    use({
      "goolord/alpha-nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("configs.ui.alpha")
      end,
    })
    use({
      "andweeb/presence.nvim",
      config = function()
        require("configs.utils.presence")
      end,
    })
    use({
      "folke/trouble.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("trouble").setup()
      end,
    })
    use({ "mrjones2014/smart-splits.nvim" })
    use({ "moll/vim-bbye" })
    -------------------------------------------------------------------

    ------------------------ lsp and something ------------------------
    use({
      "neovim/nvim-lspconfig",
      config = function()
        require("configs.core.lsp")
      end,
    })
    use({
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    })
    use({
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup()
      end,
    })
    use("mfussenegger/nvim-dap")
    -- cmp
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    -- luasnip
    use({
      "L3MON4D3/LuaSnip",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    })
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    --
    use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("null-ls").setup({
          sources = {
            -- check di https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
            require("null-ls").builtins.formatting.stylua,
            require("null-ls").builtins.diagnostics.eslint,
            require("null-ls").builtins.completion.spell,
            require("null-ls").builtins.formatting.dart_format,
          },
        })
      end,
    })
    -------------------------------------------------------------------

    --------------------- language specific ---------------------------
    use({
      "akinsho/flutter-tools.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("configs.core.flutter-tools")
      end,
    })
    -------------------------------------------------------------------
  end,
})
