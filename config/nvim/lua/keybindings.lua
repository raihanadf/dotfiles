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

keybind("n", ";", "<ESC>:", {}) -- override ; to :
nskeymap("<Space>", "<leader>") -- make spasi pas normal mode aja

-----------------------------------------------------------------

-----------------------------------------------------------------
-- nskeymap [[ normal silent keybinds ]]

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

nskeymap("<leader>\"", ":split<CR>")
nskeymap("<leader>%", ":vsplit<CR>")
-----------------------------------------------------------------

-----------------------------------------------------------------
-- nkeymap [[ normal noremap keybinds ]]

---- move to split window (mapped to h,j,k,l)
nrkeymap("<c-h>", "<c-w>h")
nrkeymap("<c-j>", "<c-w>j")
nrkeymap("<c-k>", "<c-w>k")
nrkeymap("<c-l>", "<c-w>l")

---- lsp keymap
nskeymap("<c-i>", ":lua vim.lsp.buf.format({ async = true })<cr>")
nskeymap("gd", ":lua require('telescope.builtin').lsp_definitions()<cr>")
nskeymap("gD", ":lua vim.lsp.buf.declaration()<cr>")
nskeymap("gi", ":lua vim.lsp.buf.implementation()<cr>")
nskeymap("gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
nskeymap("ge", ":lua vim.lsp.buf.document_symbol()<cr>")
nskeymap("gw", ":lua vim.lsp.buf.workspace_symbol()<cr>")
nskeymap("<leader>rr", ":lua vim.lsp.buf.references()<cr>")
nskeymap("gt", ":lua vim.lsp.buf.type_definition()<cr>")
nskeymap("gk", ":lua vim.lsp.buf.hover()<cr>")
nskeymap("<c-s>", ":lua vim.lsp.buf.signature_help()<cr>")
nskeymap("gr", ":lua vim.lsp.buf.code_action()<cr>")
nskeymap("<leader>gr", ":lua vim.lsp.buf.rename()<cr>")

---- git keymap --> highlight
nskeymap("<leader>hb", ":Gitsigns blame_line<cr>")

---- telescope
nskeymap("<c-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nskeymap("<leader>p", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nskeymap("<leader>s", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>") -- live grep
nskeymap("<leader>ss", "<cmd>lua require('telescope.builtin').live_grep()<cr>")                -- live grep
nskeymap("<leader>fmp", "<cmd>lua require('telescope.builtin').man_pages()<cr>")
nskeymap("<leader>ffm", "<cmd>lua require('telescope').extensions.flutter.commands()<cr>")
nskeymap("<leader>ffb", ":FlutterRun<CR>")     -- Run Project
nskeymap("<leader>ffr", ":FlutterRestart<CR>") -- Restart Project
nskeymap("<leader>ffh", ":FlutterReload<CR>")  -- Reload Project
-----------------------------------------------------------------

---- nvim tree
nskeymap("<leader>gl", ":Glow<cr>")

---- nvim tree
nskeymap("<leader>e", ":NvimTreeToggle<cr>")

---- mini map
nskeymap("<leader>m", ":lua MiniMap.toggle()<cr>")

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

---- toggle trouble
nskeymap("<leader>tr", ":TroubleToggle<CR>")

---- vimtex
nskeymap("<leader>vc", ":VimtexCompile<CR>")
nskeymap("<leader>vv", ":VimtexView<CR>")

-- -- [[ Basic Keymaps ]]
--
-- -- Keymaps for better default experience
-- -- See `:help vim.keymap.set()`
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
--
-- -- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--
-- -- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- local nmap = function(keys, func, desc)
--   if desc then
--     desc = 'LSP: ' .. desc
--   end
--
--   vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
-- end
--
-- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
-- nmap('<leader>ca', function()
--   vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
-- end, '[C]ode [A]ction')
--
-- -- nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
-- -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
-- -- nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
-- -- nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
-- -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
-- -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
-- -- Lesser used LSP functionality
-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
-- nmap('<leader>wl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, '[W]orkspace [L]ist Folders')
