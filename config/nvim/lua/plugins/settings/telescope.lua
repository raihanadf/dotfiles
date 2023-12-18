local ok, telescope = pcall(require, "telescope")
if not ok then
	vim.notify("telescope blom keinstall")
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<c-j>"] = actions.move_selection_next,
				["<c-k>"] = actions.move_selection_previous,
			},
			n = {},
		},
	},
})

require("telescope").load_extension("flutter") -- Flutter
