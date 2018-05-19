#!/bin/sh

echo '------------ fugashi-vim installer'

type git || {
  echo 'Please install git, before installing fugashi-vim.'
  exit 1
}

echo '-------- dein.vim'

if [ ! -d "${HOME}/.local/share/dein" ]; then
  echo 'Install dein.vim'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh)" -c "${HOME}/.local/share/dein"
  echo 'Done.'
fi

echo '-------- fugashi-vim'

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

echo 'Complete fugashi-vim setup'

