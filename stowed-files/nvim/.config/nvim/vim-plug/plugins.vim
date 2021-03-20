" == VIM-PLUG AUTO-INSTALL =========================
if empty(glob('~/.config/nvim/autoload/plug.vim'))                              
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs              
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim       
  "autocmd VimEnter * PlugInstall                                               
  "autocmd VimEnter * PlugInstall | source $MYVIMRC                             
endif                                                                           
""                                                                                  
" == VIM-PLUG SECTION ==============================
call plug#begin('~/.config/nvim/autoload/plugged')                              
  " Plugin Section                                                              
  " Themes
  Plug 'dracula/vim'                                                            
  Plug 'dikiaap/minimalist'
  Plug 'joshdick/onedark.vim'
  Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

  " FileBrowser
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'

  " FuzzySearch
  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Plug 'junegunn/fzf.vim'

  " Vim-visual-multi
  "Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " Web development core plugins
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Plug 'prettier/vim-prettier' , {
  "\ 'do': 'yarn install',
  "\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }
  "Plug 'pangloss/vim-javascript'
  "Plug 'maxmellon/vim-jsx-pretty'
  "Plug 'leafgarland/typescript-vim'
  "Plug 'peitalin/vim-jsx-typescript'

  " Web development extra plugins
  "Plug 'SirVer/ultisnips'
  "Plug 'mlaursen/vim-react-snippets'
  Plug 'tpope/vim-fugitive'

  " Vim-airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()                                                                 

" == SET THEME ==========================
" if (has("termguicolors"))
 " set termguicolors
" endif
syntax enable
colorscheme nord 

" == FILE BROWSER CONFIG ===========================
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <M-b> :NERDTreeToggle<CR>

" == FZF SEARCH MAPPINGS ===========================
"nnoremap <C-p> :FZF<CR>
"let g:fzf_action = {
  "\ 'ctrl-t': 'tab split',
  "\ 'ctrl-s': 'split',
  "\ 'ctrl-v': 'vsplit'
  "\}
" install the_silver_searcher for this next setting
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" == CoC CONFIG ====================================
"let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" == Prettier Config ===============================
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
"let g:prettier#config#tab_width = 2
"let g:prettier#config#use_tabs = 'false'
