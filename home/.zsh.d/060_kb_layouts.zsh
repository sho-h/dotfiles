# キーマップを変更する。

# C-h -> Backspace
stty erase ^H

# SSH でログインしている場合には変更しない。
if [ "x$SSH_TTY" = "x" ]; then
  xmodmap /home/sho-h/.xmodmap
fi

# Local variables:
# mode: sh
# coding: euc-jp
# End:
