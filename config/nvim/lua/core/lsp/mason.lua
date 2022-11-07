-- list servers, make nama file aja sekarang
-- misal nama server sumneko_lua tapi nama setting file sumneko
-- ngelistnya make sumneko aja

local server_setting = {

  -- spesific
	"sumneko", -- lua
	"flutter", -- flutter // uses flutter-tools

	-- php
	"intelephense",
	"phpactor",

	"html",
	"tailwindcss",
}

-- list server to be installed
local default_servers = {
	"intelephense",
	"sumneko_lua",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

-- make settingan di atas buat mason
require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = default_servers,
	automatic_installation = true,
})

-- this is automatic, but it only works on servers
-- that are on lspconfig or mason installer, so u need
-- to setup external servers manually. ie, flutter-tools
-- mungkin kalo ada code lain bisa taro sini
--
-- btw make settingan kaya gini buat per server, misal:
-- settings/something.lua

-- local M = {}
-- M.setup = function(on_attach, capabilities)
--   require("lspconfig").something.setup({ -- kalo external mungkin beda dikit
--     settings = {}, -- misal apa kek
--     on_attach = on_attach,
--     capabilities = capabilities,
--   })
-- end
-- return M

-- TODO: automate this with default config below this

local utils = require("core.lsp.utils")

for _, server in ipairs(server_setting) do
	require("core.lsp.settings." .. server).setup(utils.on_attach, utils.capabilities)
end
