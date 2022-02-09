syntax on

" color
set termguicolors
set pumblend=18

" basic
set nu

" tab
set expandtab
set tabstop=4
set shiftwidth=4

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
" WSL yank support
" https://vi.stackexchange.com/questions/15182/copying-from-vim-to-ubuntu-bash-on-windows/15190#15190
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " default location
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
  augroup END
endif

" normal + visual mode keymap
" this keybind for lily58 keyboard
noremap # $

" terminal mode keymap
" change command mode
tnoremap <silent> <ESC> <C-\><C-n>

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " ddc.vim settings
  " base
  call dein#add('Shougo/ddc.vim')
  call dein#add('vim-denops/denops.vim')
  " sources
  call dein#add('Shougo/ddc-around')
  call dein#add('Shougo/ddc-nvim-lsp')
  " 
  call dein#add('Shougo/ddc-matcher_head')
  call dein#add('Shougo/ddc-sorter_rank')
  call dein#add('matsui54/denops-popup-preview.vim')
  call dein#add('ray-x/lsp_signature.nvim')
  " lsp installer
  call dein#add('neovim/nvim-lspconfig')
  call dein#add('williamboman/nvim-lsp-installer')

  " Add or remove your plugins here:
  call dein#add('scrooloose/nerdtree')
  call dein#add('pangloss/vim-javascript')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('stephpy/vim-yaml')
  call dein#add('kopischke/vim-stay')
  call dein#add('patstockwell/vim-monokai-tasty')
  call dein#add('tpope/vim-pathogen')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('posva/vim-vue')
  call dein#add('tpope/vim-markdown')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('vim-airline/vim-airline')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tpope/vim-sleuth')

  " Required:
  call dein#end()
  call dein#save_state()

endif

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

"---- begin for plugin settings ----
" nerdtree
map <C-e> :NERDTreeToggle %<CR>

" vim-stay
set viewoptions=cursor,folds,slash,unix

" molokai
colorscheme vim-monokai-tasty

" syntastic
execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'passive_filetypes': ['java'] }

if matchstr(system('yamllint --version'), '^yamllint\s[0-9.]*') != ''
  let g:syntastic_yaml_checkers = ['yamllint']
endif

" python
let g:syntastic_python_checkers = ['flake8']

" vim-markdown
let g:markdown_fenced_languages = ['c', 'js=javascript', 'json', 'xml']

" lsp
:lua require('nvim-lsp')
set completeopt=menuone
call popup_preview#enable()

" ddc
call ddc#custom#patch_global('sources', ['nvim-lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', {
      \ 'nvim-lsp': {
      \   'mark': 'lsp',
      \   'forceCompletionPattern': '\.\w*|:\w*|->\w*',
      \ },
      \ 'around'  : {'mark': 'ar'},
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })

call ddc#enable()
"----- end for plugin settings -----

