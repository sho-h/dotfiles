# �����ޥåפ��ѹ����롣

# C-h -> Backspace
stty erase ^H

# SSH �ǥ����󤷤Ƥ�����ˤ��ѹ����ʤ���
if [ "x$SSH_TTY" = "x" ]; then
  xmodmap /home/sho-h/.xmodmap
fi

# Local variables:
# mode: sh
# coding: euc-jp
# End:
