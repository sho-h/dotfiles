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
# 補完候補を Emacs 風(Ctrl-Fなど)に選択する。候補が1つ以上ある場合に有
# 効になる。
zstyle ':completion:*:default' menu select=1

# Local variables:
# mode: sh
# coding: euc-jp
# End:
