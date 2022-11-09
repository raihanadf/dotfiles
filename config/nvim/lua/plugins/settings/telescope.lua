local ok, telescope = pcall(require, "telescope")
if not ok then
	vim.notify("telescope blom keinstall")
	return
end

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<c-t>"] = trouble.open_with_trouble,
			},
			n = {
				["<c-t>"] = trouble.open_with_trouble,
			},
		},
	},
})

require("telescope").load_extension("flutter") -- Flutter
