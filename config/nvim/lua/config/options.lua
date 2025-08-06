-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Disable swap file
vim.opt.swapfile = false

vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 250

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Cursor line
vim.o.cursorline = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    -- Set barbar.nvim highlights based on current colorscheme
    vim.api.nvim_set_hl(0, 'BufferCurrent', { link = 'TabLineSel' })  -- Active buffer
    vim.api.nvim_set_hl(0, 'BufferVisible', { link = 'TabLine' })      -- Visible but inactive
    vim.api.nvim_set_hl(0, 'BufferInactive', { link = 'TabLineFill' }) -- Hidden buffers

    -- Optional: Override with specific colors (if linking isn't enough)
    -- vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = '#ffffff', bg = '#3b4261', bold = true })
  end,
  group = vim.api.nvim_create_augroup('BarbarColors', { clear = true }),
})
