syntax on

" basic
set nu

" tab
set expandtab
set tabstop=2
set shiftwidth=2

" undo
if has('persistent_undo')
  set undodir=~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.dein.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.dein.vim'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('scrooloose/nerdtree')
call dein#add('pangloss/vim-javascript')
call dein#add('restore_view.vim')

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
map <C-e> :NERDTreeToggle<CR>

"----- end for plugin settings -----


