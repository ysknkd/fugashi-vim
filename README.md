# fugashi-vim

自分用の vim 環境です。独断と偏見で必要最低限のプラグインだけに絞りました。

## Install

vimのプラグインマネージャとしてdein.vimを使っていますので、dein.vimをインストールしてください。

 * [dein.vim - Quick start](https://github.com/Shougo/dein.vim#quick-start)

dein.vim をインストールします。

```
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh installer.sh ~/.local/share/dein
```

既存の`.vimrc`を置き換えます。

```
$ git clone https://ysknkd@bitbucket.org/ysknkd/fugashi-vim.git ~/.fugashi-vim
$ mv ~/.vimrc ~/.vimrc_old
$ ln -s ~/.fugashi-vim/.vimrc ~/.vimrc
```

vim を起動すると、プラグインのインストールが行われます。

```
$ vim
```

---

以上

