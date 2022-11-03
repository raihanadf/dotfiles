-- required modules

-- impatient
vim.defer_fn(function()
	pcall(require, "impatient")
end, 0)

require("themes")

require("option")
require("keybinding")
require("plugin")

-- colorscheme
-- vim.cmd "set fillchars+=vert:│"
-- vim.cmd 'colorscheme codesmell_dark'
