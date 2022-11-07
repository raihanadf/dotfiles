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
	use("nvim-lua/popup.nvim") -- popup api
	use("nvim-lua/plenary.nvim") -- stdlib
	use("lewis6991/impatient.nvim")
	use("nvim-treesitter/nvim-treesitter") -- syntax highlighting
	use("declancm/cinnamon.nvim") -- smooth scrolling cuy
	use("terrortylor/nvim-comment") -- nvim comment
	use("windwp/nvim-autopairs") -- autopairs
	use("norcalli/nvim-colorizer.lua") -- colorizer
	-- core ^

	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use("mrjones2014/smart-splits.nvim") -- buat ngesplit sama resize mantap
	use("moll/vim-bbye") -- bye bye buffer, biar gak ikutan keclose yg laen
	use("goolord/alpha-nvim") -- fancy startup
	use("nvim-tree/nvim-tree.lua") -- fancy startup
	use("akinsho/toggleterm.nvim") -- toggle term
	use("folke/trouble.nvim") -- trouble diagnostic
	use("nvim-telescope/telescope.nvim") -- telescopeeeee
	use("nvim-telescope/telescope-ui-select.nvim") -- ui select with telescope
	use("lukas-reineke/indent-blankline.nvim") -- indenting line
	use("lewis6991/gitsigns.nvim") -- git signs
	-- ui ^

	use("andweeb/presence.nvim") -- pamer neovim di discord
	-- misc ^
	-------------------------------------------------------------------

	------------------------ lsp and something ------------------------
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")

	-- dap
	use("mfussenegger/nvim-dap")

	-- cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	-- luasnip
	use("rafamadriz/friendly-snippets")
	use("L3MON4D3/LuaSnip")
	use({
		"saadparwaiz1/cmp_luasnip",
		config = function()
			require("core.lsp.luasnip")
		end,
	})

	use("jose-elias-alvarez/null-ls.nvim")
	use("RRethy/vim-illuminate")

	-- external language specific lsp
	use("akinsho/flutter-tools.nvim")
	-- use("jwalton512/vim-blade")
	use("honza/vim-snippets")
	use({
		"smjonas/snippet-converter.nvim",
		-- SnippetConverter uses semantic versioning. Example: use version = "1.*" to avoid breaking changes on version 1.
		-- Uncomment the next line to follow stable releases only.
		-- tag = "*",
		config = function()
			local template = {
				-- name = "t1", (optionally give your template a name to refer to it in the `ConvertSnippets` command)
				sources = {
					ultisnips = {
						-- Add snippets from (plugin) folders or individual files on your runtimepath...
						"./vim-snippets/UltiSnips",
						-- ...or use absolute paths on your system.
						vim.fn.stdpath("config") .. "/UltiSnips",
					},
					snipmate = {
						"vim-snippets/snippets",
					},
				},
				output = {
					-- Specify the output formats and paths
					vscode_luasnip = {
						vim.fn.stdpath("config") .. "/luasnip_snippets",
					},
				},
			}

			require("snippet_converter").setup({
				templates = { template },
				-- To change the default settings (see configuration section in the documentation)
				-- settings = {},
			})
		end,
	})
	-------------------------------------------------------------------

	-- automatis setup config abis clone packer.nvim
	-- taroh paling bawah
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
