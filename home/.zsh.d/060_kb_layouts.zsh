# �����ޥåפ��ѹ����롣

# C-h -> Backspace
stty erase ^H

# SSH �ǥ����󤷤Ƥ�����ˤ��ѹ����ʤ���
if [ "x$SSH_TTY" = "x" ]; then
  case ${OSTYPE} in
    linux*)
      xmodmap ${HOME}/.xmodmap
      ;;
  esac
fi

# Local variables:
# mode: sh
# coding: euc-jp
# End:
