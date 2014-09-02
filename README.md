# sho-h/dotfiles

sho-h 個人の環境のための dotfiles。

## 必要なソフトウェア

* Git
* Ruby
* homesick(gemパッケージ)

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

## 更新

    $ homesick pull dotfiles
    $ homesick symlink dotfiles
