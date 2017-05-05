# Emacs caskの設定。

case ${OSTYPE} in
  darwin*)
    # Macはbrewでcaskをインストールする想定。
    ;;
  linux*)
    export PATH=$PATH:~/.cask/bin
    ;;
esac

# Local variables:
# mode: sh
# coding: utf-8
# End:
