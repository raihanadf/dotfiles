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
nskeymap("gd", ":lua vim.lsp.buf.definition()<cr>")
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
nskeymap("<leader>ss", ":lua require('telescope.builtin').live_grep()<cr>")                -- live grep
nskeymap("<leader>mp", "<cmd>lua require('telescope.builtin').man_pages()<cr>")
nskeymap("<leader>fm", "<cmd>lua require('telescope').extensions.flutter.commands()<cr>")
nskeymap("<leader>fb", ":FlutterRun -v<CR>")     -- Run Project
nskeymap("<leader>fr", ":FlutterRestart<CR>") -- Restart Project
nskeymap("<leader>fh", ":FlutterReload<CR>")  -- Reload Project
-----------------------------------------------------------------

---- auto session
nskeymap("<leader>sa", ":Autosession search<CR>")     -- Run Project

---- nvim tree
nskeymap("<leader>gl", ":Glow<cr>")

---- nvim tree
nskeymap("<leader>e", ":NvimTreeToggle<cr>")

---- avante toggle
nskeymap("<leader>c", ":AvanteToggle<cr>")

---- mini map
nskeymap("<leader>mm", ":lua MiniMap.toggle()<cr>")

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

-- toggle inline diagnostics (ii)
nskeymap("<Leader>ii", ":lua vim.cmd(\"DiagnosticsToggleVirtualText\")<CR>")
-- toggle diagnostics (id)
nskeymap("<Leader>id", ":lua vim.cmd(\"DiagnosticsToggle\")<CR>")

vim.api.nvim_create_user_command(
  'DiagnosticsToggleVirtualText',
  function()
    local current_value = vim.diagnostic.config().virtual_text
    if current_value then
      vim.diagnostic.config({virtual_text = false})
    else
      vim.diagnostic.config({virtual_text = true})
    end
  end,
  {}
)

-- Command to toggle diagnostics
vim.api.nvim_create_user_command(
  'DiagnosticsToggle',
  function()
    local current_value = vim.diagnostic.is_disabled()
    if current_value then
      vim.diagnostic.enable()
    else
      vim.diagnostic.disable()
    end
  end,
  {}
)
