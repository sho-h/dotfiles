#! ultimate completion
autoload -U compinit
compinit -u

#! don't differentiation upcase and downcase completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#! color completion
if [ "$COLOR_P" = "t" ]; then
    eval `dircolors`
    LS_COLORS='di=00;36:'
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

##############################
# �䴰����� Emacs ��(Ctrl-F�ʤ�)�����򤹤롣���䤬1�İʾ夢�����ͭ
# ���ˤʤ롣
zstyle ':completion:*:default' menu select=1

# Local variables:
# mode: sh
# coding: euc-jp
# End:
