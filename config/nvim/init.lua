vim.defer_fn(function()
	pcall(require, "core.impatient")
end, 0)

require("options") -- vim options
require("keybindings") -- keybindings ofc
require("colorschemes") -- colorscheme

require("plugins") -- init plugins

vim.opt.statusline = "%!v:lua.require('staline').run()"
