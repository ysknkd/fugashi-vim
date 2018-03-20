syntax on

" basic
set nu

" tab
set expandtab
set tabstop=2
set shiftwidth=2

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

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(expand('~/.local/share/dein'))
  call dein#begin(expand('~/.local/share/dein'))

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('scrooloose/nerdtree')
  call dein#add('pangloss/vim-javascript')

  " Required:
  call dein#end()
  call dein#save_state()

  " Required:
  filetype plugin indent on

  " If you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif
endif
"End dein Scripts-------------------------

"---- begin for plugin settings ----
map <C-e> :NERDTreeToggle<CR>

"----- end for plugin settings -----


