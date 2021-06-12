# fugashi-vim

This is my .vimrc. Use dein.vim for plugin manager.
  
## Prerequisite

* neovim

## Installation

Install dein.vim and fugashi-vim. Installer deploy dein.vim to `~/.local/share/dein`, fugashi-vim to `~/.fugashi-vim` .

```console
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ysknkd/fugashi-vim/master/bin/installer.sh)"
```

`:call dein#install()` in neovim. 

### Manual installation

dein.vim をインストールします。

* [dein.vim - Quick start](https://github.com/Shougo/dein.vim#quick-start)

```console
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh installer.sh ~/.local/share/dein
```

既存の`.vimrc`を置き換えます。

```console
$ git clone https://github.com/ysknkd/fugashi-vim.git ~/.fugashi-vim
$ mv ~/.vimrc ~/.vimrc_old
$ ln -s ~/.fugashi-vim/.vimrc ~/.vimrc
```

`.vim` ディレクトリが存在しない場合は作成します。

```console
$ mkdir ~/.vim
```

