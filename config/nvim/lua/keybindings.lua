-- Quick note for myself : disable unused keybindings
-------------------------General-------------------------------

-- keybindings / keymaps
local keybind = vim.api.nvim_set_keymap
local noremap = { noremap = true } -- for 4th param (opts)
local silent = { silent = true }

-- keymap functions
---- normal mode noremap
local function nrkeymap(key, map)
	keybind("n", key, map, noremap)
end

---- normal and silent map
local function nskeymap(key, map)
	keybind("n", key, map, silent)
end

---- visual and noremap
local function vrkeymap(key, map)
	keybind("v", key, map, noremap)
end

---- visual and silent map
local function vskeymap(key, map)
	keybind("v", key, map, silent)
end

---- insert and silent map
local function iskeymap(key, map)
	keybind("i", key, map, silent)
end

-----------------------------------------------------------------

-- general
keybind("n", "<c-s>", ":w<CR>", {}) -- save
keybind("i", "<c-s>", "<ESC>:w<CR>", {}) -- save (in normal mode)

keybind("n", ";", "<ESC>:", {}) -- override ; to :

-----------------------------------------------------------------

-----------------------------------------------------------------
-- nskeymap [[ normal silent keybinds ]]

-- gantinya leader "\"
nskeymap("<Space>", "<leader>") -- make spasi pas normal mode aja
---- buffers
-- nskeymap("<leader>w", ":bd<CR>") -- close buffer
-- nskeymap('<S-k>', ':bn<CR>') -- next buffer
-- nskeymap('<S-j>', ':bp<CR>') -- prev buffer
nskeymap("<leader>w", ":Bdelete<CR>") -- close buffer
nskeymap("<S-k>", ":BufferLineCycleNext<CR>")
nskeymap("<S-j>", ":BufferLineCyclePrev<CR>")
nskeymap("<leader>'", ":BufferLineMoveNext<CR>")
nskeymap("<leader>;", ":BufferLineMovePrev<CR>")
--
---- clear search highlight
nskeymap("<leader>l", ":nohlsearch<cr>")

---- nvim commenter
nskeymap("gc", ":CommentToggle<cr>")
vskeymap("gc", ":CommentToggle<cr>")
iskeymap("gc", "<ESC>:CommentToggle<cr>")
-----------------------------------------------------------------

-----------------------------------------------------------------
-- nkeymap [[ normal noremap keybinds ]]
---- move to split window (mapped to h,j,k,l)
nrkeymap("<c-h>", "<c-w>h")
nrkeymap("<c-j>", "<c-w>j")
nrkeymap("<c-k>", "<c-w>k")
nrkeymap("<c-l>", "<c-w>l")
---- lsp keymap
nskeymap("<c-S-i>", ":lua vim.lsp.buf.format { async = true }<cr>")
nskeymap("gd", "<cmd>lua vim.lsp.buf.definition<CR>")
nrkeymap("gD", ":lua vim.lsp.buf.declaration()<cr>")
nrkeymap("gi", ":lua vim.lsp.buf.implementation()<cr>")
nrkeymap("gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
nrkeymap("gw", ":lua vim.lsp.buf.document_symbol()<cr>")
nrkeymap("gw", ":lua vim.lsp.buf.workspace_symbol()<cr>")
nrkeymap("<leader>rr", ":lua vim.lsp.buf.references()<cr>")
nrkeymap("gt", ":lua vim.lsp.buf.type_definition()<cr>")
nrkeymap("gk", ":lua vim.lsp.buf.hover()<cr>")
nrkeymap("<c-k>", ":lua vim.lsp.buf.signature_help()<cr>")
nrkeymap("gr", ":lua vim.lsp.buf.code_action()<cr>")
nrkeymap("<leader>gr", ":lua vim.lsp.buf.rename()<cr>")

---- update packer plugins
nrkeymap("<c-u><c-p>", ":PackerSync<CR>")
nrkeymap("<c-u>cp", ":PackerCompile<CR>")

---- telescope
nrkeymap("<c-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nrkeymap("<leader>ff", "<cmd>Telescope<cr>")
nrkeymap("<leader>fm", "<cmd>Telescope flutter commands<cr>")

---- nvim tree
nrkeymap("<leader>e", ":NvimTreeToggle<cr>")

---- restart neovim / source file
nskeymap("<leader>sv", ":luafile ~/.config/nvim/init.lua<cr>")
nskeymap("<leader>so", ":so %<CR>")

---- resize column
nskeymap("<C-Left>", ":lua require('smart-splits').resize_left() <cr>")
nskeymap("<C-Up>", ":lua require('smart-splits').resize_up() <cr>")
nskeymap("<C-Down>", ":lua require('smart-splits').resize_down() <cr>")
nskeymap("<C-Right>", ":lua require('smart-splits').resize_right() <cr>")

---- stay in tab indent mode
vskeymap("<", "<gv")
vskeymap(">", ">gv")
-- override yanks to previous state, jadi ga perlu copy yg sebelumnya
vskeymap("p", '"_dP')
---- stay in indent mode (lagi) versi mindahin text
vskeymap("K", ":move '<-2<CR>gv-gv")
vskeymap("J", ":move '>+1<CR>gv-gv")
-- jadiin satu line
vrkeymap("H", "<S-j>")

----- resize column without plugins
-- nskeymap("<C-Up>", ":resize -2<cr>") -- idk why is this stated as "-"
-- nskeymap("<C-Down>", ":resize +2<cr>")
-- nskeymap("<C-Left>", ":vertical resize -2<cr>")
-- nskeymap("<C-Right>", ":vertical resize +2<cr>")

---- toggle trouble
nskeymap("<leader>tr", ":TroubleToggle<CR>")

-------------------------- Flutter ------------------------------
nskeymap("<leader>fb", ":FlutterRun<CR>") -- Run Project
nskeymap("<leader>fr", ":FlutterRestart<CR>") -- Restart Project
nskeymap("<leader>fh", ":FlutterReload<CR>") -- Reload Project
-----------------------------------------------------------------

-- required/import binding
-- require("keybinds.tablike") -- deprecated maybe
