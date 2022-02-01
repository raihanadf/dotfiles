-- Quick note for myself : disable unused keybindings

-- required/import binding
require("keybinds.tablike")

-- keybindings / keymaps
local keybind = vim.api.nvim_set_keymap
local noremap = { noremap = true } -- for 4th param (opts)
local silent = { silent = true }

-- keymap functions
---- normal mode noremap
local function nrkeymap(key, map)
        keybind('n', key, map, noremap)
end
---- normal and silent map
local function nskeymap(key, map)
        keybind('n', key, map, silent)
end

-- general
keybind('n', '<c-s>', ':w<CR>', {}) -- save
keybind('i', '<c-s>', '<ESC>:w<CR>', {}) -- save (in normal mode)

-- nskeymap [[ normal silent keybinds ]]
---- buffers
nskeymap('<S-w>', ':bd<CR>') -- close buffer
nskeymap('<S-k>', ':bn<CR>') -- next buffer
nskeymap('<S-j>', ':bp<CR>') -- prev buffer
---- clear search highlight
nskeymap('<c-l>', ':nohlsearch<CR>') -- prev buffer

-- nkeymap [[ normal noremap keybinds ]]
---- move to split window (mapped to h,j,k,l)
--nrkeymap('<c-h>', '<c-w>h')
--nrkeymap('<c-j>', '<c-w>j')
--nrkeymap('<c-k>', '<c-w>k')
--nrkeymap('<c-l>', '<c-w>l')
---- lsp keymap
nrkeymap('fd', ':lua vim.lsp.buf.definition()<cr>')
nrkeymap('fD', ':lua vim.lsp.buf.declaration()<cr>')
nrkeymap('fi', ':lua vim.lsp.buf.implementation()<cr>')
nrkeymap('fw', ':lua vim.lsp.buf.document_symbol()<cr>')
nrkeymap('fw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nrkeymap('fr', ':lua vim.lsp.buf.references()<cr>')
nrkeymap('ft', ':lua vim.lsp.buf.type_definition()<cr>')
nrkeymap('fK', ':lua vim.lsp.buf.hover()<cr>')
nrkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nrkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nrkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
---- update packer plugins
nrkeymap('<c-u><c-p>', ':PackerSync<CR>')
