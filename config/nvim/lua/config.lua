local opt = vim.opt

-- settings
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.smartcase = true
opt.smartindent = true
opt.smarttab = true
opt.expandtab = true
opt.cindent = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.joinspaces = true
opt.tw = 80
--
opt.clipboard = { "unnamedplus" } -- Enable system-wide clipboard
opt.mouse = "n" -- Mouse only on normal mode
opt.updatetime = 750
opt.ttimeoutlen = 0
opt.showtabline = 2
opt.laststatus = 3
opt.diffopt:append({ "algorithm:histogram", "indent-heuristic" })
--
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.breakindentopt = {
  shift = 0,
  min = 40,
  sbr = true,
}
--
opt.swapfile = false
opt.writebackup = false
opt.autowriteall = true

-- custom for plugins

--- indent blankline
vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")
