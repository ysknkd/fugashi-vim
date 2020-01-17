# fugashi-vim

This is my .vimrc. Use dein.vim for plugin manager.
  
## Prerequisite

* neovim

e.g.) Install neovim in Ubuntu 18.04.

```console
$ sudo add-apt-repository ppa:neovim-ppa/stable
$ sudo apt update
$ sudo apt install neovim
```

## Installation

Install dein.vim and fugashi-vim. Installer deploy dein.vim to `~/.local/share/dein`, fugashi-vim to `~/.fugashi-vim` .

```console
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ysknkd/fugashi-vim/master/bin/installer.sh)"
```

```console
$ mkdir -p ~/.config/nvim
$ ln -s ~/.fugashi-vim/.vimrc ~/.config/nvim/init.vim
```

### Manual installation

vimのプラグインマネージャとしてdein.vimを使っていますので、dein.vimをインストールしてください。

* [dein.vim - Quick start](https://github.com/Shougo/dein.vim#quick-start)

dein.vim をインストールします。

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

vim を起動すると、プラグインのインストールが行われます。

```console
$ vim
```

---

以上

