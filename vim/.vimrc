" file stuff
filetype plugin on
syntax enable

" Plug plugins
call plug#begin()

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'itchyny/lightline.vim'
  Plug 'jceb/vim-orgmode'
  Plug 'tpope/vim-speeddating'
	Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'lervag/vimtex'
  Plug 'preservim/nerdtree'
  Plug 'itchyny/vim-gitbranch'
  Plug 'tpope/vim-commentary'

call plug#end()

" sets
set nocompatible
set ttymouse=sgr
set number
set bg:dark
set mouse=a
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set linebreak
set cursorline
set backspace=indent,eol,start
set laststatus=2
set wildmenu
set scrolloff=5
set incsearch
set ttimeout ttimeoutlen=25
set showtabline=2
set undodir=~/.vim/undo-dir
set undofile
set backupdir=$HOME/.vim/backups
set noshowmode
set showcmd
" set clipboard=unnamedplus

" lets
let g:vimtex_compiler_method = 'arara'
let mapleader = " "
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_termcolors = '16'
let g:python_recommended_style = 0
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" colorscheme stuff
colorscheme gruvbox

" fix colorscheme colors
hi Normal ctermbg=NONE

" remaps
nnoremap <SPACE> <Nop>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>! :q!<CR>
nnoremap <leader>x :wq<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>p :wincmd p<CR>
nnoremap <leader>v :set paste! number!<CR>
nnoremap <leader>i :CocCommand clangd.switchSourceHeader<CR>

" nerdtree stuff
" Start NERDTree. If a file is specified, move the cursor to its window.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" turn on spell checker for all markdown files
autocmd FileType markdown setlocal spell
hi clear SpellBad                                                
hi SpellBad cterm=underline                                      
hi clear SpellRare                                               
hi SpellRare cterm=underline                                     
hi clear SpellCap                                                
hi SpellCap cterm=underline                                      
hi clear SpellLocal
hi SpellLocal cterm=underline

" Coc remaps
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" lightline config
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'filename', 'readonly', 'modified' ],
  \             [ 'gitbranch'] ],
  \   'right':  [ [ 'lineinfo' ],
  \               [ 'fileformat', 'filetype' ],
  \               [ 'percent' ] ]
  \ }, 
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
  \ }
let g:lightline.component = {
  \ 'close': ' %n | X ', }

