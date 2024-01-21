if vim.g.vscode then

else
  require("plugins")   -- init plugins

  require("options")   -- vim options
  require("keybindings") -- keybindings ofc
end
