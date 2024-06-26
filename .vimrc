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

" golang
" fmt
function! _gofmt()
  exe ":!go fmt %"
  exe ":e!"
endfunction
augroup gofmt
  autocmd!
  autocmd BufWritePost *.go silent :call _gofmt()
augroup END

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
  call dein#add('Shougo/ddc-ui-native')
  call dein#add('Shougo/ddc-around')
  call dein#add('Shougo/ddc-source-lsp')
  " 
  call dein#add('Shougo/ddc-matcher_head')
  call dein#add('Shougo/ddc-sorter_rank')
  call dein#add('matsui54/denops-popup-preview.vim')
  call dein#add('matsui54/denops-signature_help')
  call dein#add('ray-x/lsp_signature.nvim')
  " lsp configure and installer
  call dein#add('neovim/nvim-lspconfig')
  call dein#add('williamboman/mason.nvim')
  call dein#add('williamboman/mason-lspconfig.nvim')

  " Add or remove your plugins here:
  call dein#add('scrooloose/nerdtree')
  call dein#add('pangloss/vim-javascript')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('stephpy/vim-yaml')
  call dein#add('kopischke/vim-stay')
  call dein#add('patstockwell/vim-monokai-tasty')
  call dein#add('tpope/vim-pathogen')
  call dein#add('posva/vim-vue')
  call dein#add('tpope/vim-markdown')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('vim-airline/vim-airline')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tpope/vim-sleuth')
  call dein#add('nvim-lua/plenary.nvim')
  call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.x' })
  call dein#add('nvim-treesitter/nvim-treesitter-context')
  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
        \ 'build': 'sh -c "cd app && npx --yes yarn install"' })

  " Required:
  call dein#end()

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

" python
let g:syntastic_python_checkers = ['flake8']

" vim-markdown
let g:markdown_fenced_languages = ['c', 'go', 'js=javascript', 'json', 'xml']

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" set default theme (dark or light)
" By default the theme is defined according to the preferences of the system
let g:mkdp_theme = 'light'

" lsp
:lua require('nvim-lsp')

" ddc
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', #{
      \   lsp: #{
      \     mark: 'lsp',
      \     forceCompletionPattern: '\.\w*|:\w*|->\w*',
      \   },
      \   around: #{
      \     mark: 'ar'
      \   },
      \   _: #{
      \     matchers: ['matcher_head'],
      \     sorters: ['sorter_rank']
      \   },
      \ })
call ddc#custom#patch_global('sourceParams', #{
      \   lsp: #{
      \     enableResolveItem: v:true,
      \     enableAdditionalTextEdit: v:true,
      \   }
      \ })
call ddc#enable()

call popup_preview#enable()
call signature_help#enable()
"----- end for plugin settings -----

