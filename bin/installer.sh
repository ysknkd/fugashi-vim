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
echo ''

REQ_VERSION=8
VIM_VERSION=$(vim --version | grep "^VIM" | sed -E "s/^VIM.*\s([0-9])\.[0-9.]+\s.*/\1/g")
if [ ${VIM_VERSION} -lt ${REQ_VERSION} ]; then
  echo 'Please install vim version 8.'
  exit 1
fi

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

echo 'Create a link to fugashi-vim `.vimrc`'
ln -s ${HOME}/.fugashi-vim/.vimrc ${HOME}/.vimrc

if [ ! -d "${HOME}/.vim" ]; then
  echo 'Create a `.vim` directory'
  mkdir ${HOME}/.vim
fi

echo ''
echo '----------------------------------'
echo '    Complete fugashi-vim setup'
echo '----------------------------------'
echo ''

