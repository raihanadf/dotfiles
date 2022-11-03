-- required modules

-- impatient
vim.defer_fn(function()
	pcall(require, "impatient")
end, 0)

require("themes")
require("staline")

require("option")
require("keybinding")
require("plugin")

-- Setting The Statusline
vim.opt.statusline = "%!v:lua.require('staline').run()"

-- colorscheme
-- vim.cmd "set fillchars+=vert:│"
-- vim.cmd 'colorscheme codesmell_dark'
