set nocompatible
colorscheme sitruuna
set mouse=a
set tabstop=4 shiftwidth=4 expandtab
set linebreak
set ttymouse=sgr
set cursorline
set backspace=indent,eol,start
set laststatus=2
set wildmenu
set scrolloff=5
set incsearch

" turn on spell checker for all markdown files
autocmd FileType markdown setlocal spell

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


hi StatusLine ctermbg=black
hi Normal ctermbg=NONE
let g:lightline = {
                \ 'colorscheme': 'sitruuna',
                            \ }
