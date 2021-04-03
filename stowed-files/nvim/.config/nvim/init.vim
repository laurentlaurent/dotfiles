" == VIM-PLUG AND CONFIG ===========================
source $HOME/.config/nvim/vim-plug/plugins.vim

" == INTEGRATED TERMINAL ===========================
" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on alt+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <M-n> :call OpenTerminal()<CR>

" == SWITCHING BETWEEN PANELS ======================
" use alt+hjkl or arrow keys to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-Left> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-Down> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-Up> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
tnoremap <A-Right> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-Left> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-Down> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-Up> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-Right> <C-w>l

"	== SETTING FOLD SETTINGS =========================	
set foldenable
set foldmethod=syntax
set foldlevelstart=10

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" == NeoVIM SETTINGS ===============================
syntax enable " enable syntax processing
set tabstop=2 softtabstop=2 " tab => 2spaces
set number " show line number
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " limit redraw
set showmatch " highlight matching parens

set incsearch ignorecase smartcase hlsearch " search options

" From how to do 90% without plugins
set nocompatible " bleh vi support
filetype plugin on " vim file plugin for netrw (will it work with neovim?)
set path +=** " Finding files - enables tab-completion for file tasks
set wildmenu " Finding files - displays all matching files when tab complete


" == Key bindings remap ============================
" setting leader key
let mapleader="\<Space>"
" setting insert mode escape
inoremap jk <esc> " jk is escape
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>s :mksession<CR>
