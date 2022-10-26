filetype plugin on
syntax enable
let g:vimtex_compiler_method = 'arara'
let maplocalleader = "\\"

set nocompatible
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_termcolors = '16'
let g:python_recommended_style = 0
colorscheme gruvbox
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
"set clipboard=unnamedplus
set showtabline=2
set undodir=~/.vim/undo-dir
set undofile

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

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jaxbot/semantic-highlight.vim'
Plug 'itchyny/lightline.vim'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'lervag/vimtex'

call plug#end()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"let s:semanticGUIColors = [ "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2" ]


" stolen from https://shapeshed.com/vim-statuslines/
"function! GitBranch()
"  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"  let g:gitparsedbranchname = strlen(l:string) > 0?'['.l:string.']':''
"endfunction

"function! StatuslineGit()
"  let l:branchname = GitBranch()
"  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
"endfunction

"function! InsertStatuslineColor(mode)
"  if a:mode == 'i'
"    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
"  elseif a:mode == 'r'
"    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
"  else
"    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
"  endif
"endfunction

"au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

set statusline=
"set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
"set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=\ %y
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=%#CursorColumn#
"set statusline+=\ %L\ lines 
"set statusline+=\ %y
"set statusline+=\
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=" >"
set statusline+=\ [%{&fileformat}\]
"set statusline+=" >"
set statusline+=\ %p%%
"set statusline+=" >"
set statusline+=\ %l/%L:%c
set statusline+=\ 


"hi StatusLine ctermbg=black
hi Normal ctermbg=NONE
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'filename', 'readonly', 'modified' ] ],
  \   'right':  [ [ 'lineinfo' ],
  \               [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ }, 
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ },
  \ }
set noshowmode
