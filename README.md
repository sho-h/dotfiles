# sho-h/dotfiles

sho-h 個人の環境のための dotfiles。

## 必要なソフトウェア

* Git
* Ruby
* homesick(gemパッケージ)
* Homebrew

## インストール

dotfilesの取得。

    $ homesick clone sho-h/dotfiles

$HOME/.gitconfig.localの作成。

```
[user]
        name  = Taro Matsue
        email = taromatsue@example.com
```

symlinkの作成。

    $ homesick symlink dotfiles

以下、Mac の場合は追加で実行する。(TODO: 最近の方法に修正)

    $ cd
    $ brew bundle
    # TODO: 修正する

## 更新

    $ homesick pull dotfiles
    $ homesick symlink dotfiles
