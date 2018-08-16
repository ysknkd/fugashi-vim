syntax on

" basic
set nu

" tab
set expandtab
set tabstop=2
set shiftwidth=2

" wrap
set nowrap

" encoding
set encoding=utf-8

" undo
if has('persistent_undo')
  set undodir=~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif

" clipboard
set clipboard+=unnamed

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.local/share/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('scrooloose/nerdtree')
call dein#add('pangloss/vim-javascript')
call dein#add('stephpy/vim-yaml')
call dein#add('kopischke/vim-stay')
call dein#add('tomasr/molokai')
call dein#add('tpope/vim-pathogen')
call dein#add('vim-syntastic/syntastic')
call dein#add('posva/vim-vue')
call dein#add('tpope/vim-markdown')

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

"---- begin for plugin settings ----
" nerdtree
map <C-e> :NERDTreeToggle<CR>

" vim-stay
set viewoptions=cursor,folds,slash,unix

" molokai
colorscheme molokai

" syntastic
execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if matchstr(system('yamllint --version'), '^yamllint\s[0-9.]*') != ''
  let g:syntastic_yaml_checkers = ['yamllint']
endif

" vim-markdown
let g:markdown_fenced_languages = ['c', 'js=javascript', 'json', 'xml']

"----- end for plugin settings -----

