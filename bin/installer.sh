#!/bin/sh

echo ''
echo '----------------------------------'
echo '      fugashi-vim installer'
echo '----------------------------------'
echo ''

type git || {
  echo 'Please install git, before installing fugashi-vim.'
  exit 1
}
type nvim || {
  echo 'Please install neo-vim, before installing fugashi-vim.'
  exit 1
}
echo ''

echo '-------- Download dein.vim'

if [ ! -d "${HOME}/.local/share/dein" ]; then
  echo 'Install dein.vim'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh)" -c "${HOME}/.local/share/dein"
  echo 'Done.'
fi

echo '-------- Download fugashi-vim'

if [ ! -d "${HOME}/.fugashi-vim" ]; then
  echo 'Fetching fugashi-vim'
  git clone https://github.com/ysknkd/fugashi-vim.git ${HOME}/.fugashi-vim
  echo 'Done.'
fi

if [ -e "${HOME}/.vimrc" ]; then
  echo 'Rename a `.vimrc` to `.vimrc.bak`'
  mv ${HOME}/.vimrc ${HOME}/.vimrc.bak
fi

if [ ! -d "${HOME}/.config/nvim" ]; then
  echo 'Create a `.config/nvim` directory'
  mkdir -p ${HOME}/.config/nvim
fi

if [ -e "${HOME}/.config/nvim/init.vim" ]; then
  echo 'Rename a `init.vim` to `init.vim.bak`'
  mv ${HOME}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim.bak
fi

echo 'Create a link to fugashi-vim `.vimrc`'
ln -s ${HOME}/.fugashi-vim/.vimrc ${HOME}/.config/nvim/init.vim

echo 'Create a link to fugashi-vim `lua`'
ln -s ${HOME}/.fugashi-vim/lua ${HOME}/.config/nvim/lua

echo ''
echo '----------------------------------'
echo '    Complete fugashi-vim setup'
echo '----------------------------------'
echo ''

