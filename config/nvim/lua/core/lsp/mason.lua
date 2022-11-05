-- list servers, make nama file aja sekarang
-- misal nama server sumneko_lua tapi nama setting file sumneko
-- ngelistnya make sumneko aja

local server_setting = {
	"sumneko",
	"flutter",
}

-- list server to be installed
local default_servers = {
	"intelephense",
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

-- INFO: this what default setting was

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(default_servers) do

	opts = {
		on_attach = require("core.lsp.utils").on_attach,
		capabilities = require("core.lsp.utils").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "core.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)

end
