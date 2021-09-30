"Raihan's neovim/vim config (to lua soon if im not lazy)

syntax on
set nu rnu
set smartcase
set smartindent
set smarttab
set expandtab
set cindent
set tabstop=2
set shiftwidth=2
set encoding=UTF-8

call plug#begin('~/.vim/plugged')

" general

Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'

" langs
Plug 'neoclide/coc.nvim'

call plug#end()

set termguicolors

"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1

colorscheme gruvbox

" ========== Plugins ==========

" NERDTREE
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


" Airline
let g:airline#extensions#tabline#enabled = 1

" Coc
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" ========== Keymapping ==========

" //tabs

nnoremap <S-k> gt
nnoremap <S-j> gT

" //search

nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" //nerdtree
 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" //use tab to autocomplete

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Rename
nmap <F2> <Plug>(coc-rename)

" //comment

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
