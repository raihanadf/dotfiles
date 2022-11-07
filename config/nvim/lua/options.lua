local o = vim.opt
local g = vim.g

-- settings
local options = {
  number = true,
  relativenumber = true,
  termguicolors = true,
  smartcase = true,
  smartindent = true,
  smarttab = true,
  expandtab = true,
  cindent = true,
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  splitbelow = true,
  splitright = true,
  joinspaces = true,
  tw = 80,
  cursorline = true,
  --
  clipboard = { "unnamedplus" }, -- make clipboard system
  mouse = "n", -- mouse mode??? wtff
  timeoutlen = 300,
  updatetime = 300,
  showtabline = 2,
  laststatus = 3,
  --
  showmode = false,
  undofile = true,
  signcolumn = "yes" ,
  numberwidth = 2,
  wrap = true,
  linebreak = true,
  breakindent = true,
  breakindentopt = {
    shift = 0,
    min = 40,
    sbr = true,
  },
  --
  backup = false,
  swapfile = false,
  writebackup = false,
  autowriteall = true,
}

-- for loops all of the option above
for k, v in pairs(options) do
  o[k] = v
end

----------------------- ext plugins -----------------------
--- indent blankline
-- vim.o.list = true

-- Blade to html
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.blade.php",
--   command = "setlocal ft=html",
-- })
