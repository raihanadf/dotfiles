vim.defer_fn(function()
  pcall(require, "core.impatient")
end, 0)

require("plugins")     -- init plugins

require("options")     -- vim options
require("keybindings") -- keybindings ofc
