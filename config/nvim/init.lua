vim.defer_fn(function()
  pcall(require, "core.impatient")
end, 0)

require 'core.init'                       -- core

require 'options'                         -- vim options
require 'keybindings'                     -- keybindings ofc
require 'plugins'                         -- init plugins

require 'themes'                          -- colorscheme
vim.opt.statusline = "%!v:lua.require('staline').run()"
