-- settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.go.smartcase = true
vim.go.smartindent = true
vim.go.smarttab = true
vim.go.expandtab = true
vim.go.cindent = true
vim.go.shiftwidth = 2
vim.go.softtabstop = 2
vim.go.tw = 80

-- colorscheme
-- vim.g.gruvbox_flat_style = "dark"
vim.cmd 'colorscheme ayu-dark'

-- custom for plugins
--- indent blankline
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
