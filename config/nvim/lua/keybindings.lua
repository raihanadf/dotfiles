-- Quick note for myself : disable unused keybindings

-------------------------General-------------------------------

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
---- visual and silent map
local function vskeymap(key, map)
  keybind('v', key, map, silent)
end
---- insert and silent map
local function iskeymap(key, map)
  keybind('i', key, map, silent)
end
-----------------------------------------------------------------

-- general
keybind('n', '<c-s>', ':w<CR>', {}) -- save
keybind('i', '<c-s>', '<ESC>:w<CR>', {}) -- save (in normal mode)

-----------------------------------------------------------------


-----------------------------------------------------------------
-- nskeymap [[ normal silent keybinds ]]
--
---- buffers
nskeymap('<leader>w', ':bd<CR>') -- close buffer
-- nskeymap('<S-k>', ':bn<CR>') -- next buffer
-- nskeymap('<S-j>', ':bp<CR>') -- prev buffer
nskeymap('<S-k>', ':BufferLineCycleNext<CR>')
nskeymap('<S-j>', ':BufferLineCyclePrev<CR>')
nskeymap("<leader>'", ':BufferLineMoveNext<CR>')
nskeymap("<leader>;", ':BufferLineMovePrev<CR>')
--
---- clear search highlight
nskeymap('<leader>l', ':nohlsearch<cr>')

---- nvim commenter
nskeymap("<leader>+", ":CommentToggle<cr>")
vskeymap("<leader>+", ":CommentToggle<cr>")
iskeymap("<leader>+", "<ESC>:CommentToggle<cr>")
-----------------------------------------------------------------

-----------------------------------------------------------------
-- nkeymap [[ normal noremap keybinds ]]
---- move to split window (mapped to h,j,k,l)
nrkeymap('<c-h>', '<c-w>h')
nrkeymap('<c-j>', '<c-w>j')
nrkeymap('<c-k>', '<c-w>k')
nrkeymap('<c-l>', '<c-w>l')
---- lsp keymap
nrkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nrkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nrkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nrkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nrkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nrkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nrkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nrkeymap('gK', ':lua vim.lsp.buf.hover()<cr>')
nrkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nrkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nrkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')

---- update packer plugins
nrkeymap('<c-u><c-p>', ':PackerSync<CR>')

---- telescope
nrkeymap("<c-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>")

---- nvim tree
nrkeymap("<leader>e", ":NvimTreeToggle<cr>")
-----------------------------------------------------------------
