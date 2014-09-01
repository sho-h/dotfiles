
##############################
#! Is colorful terminal ?

export COLOR_P
if [ "$TERM" = "dumb" -o "$TERM" = "emacs" ]; then
    COLOR_P="nil"
else # color
    COLOR_P="t"
fi

##############################
#! autoload

if [ "$COLOR_P" = "t" ]; then
#! colorful
    autoload -U colors
    colors
fi

#! left prompt
if [ "$COLOR_P" = "t" ]; then
    PS1="%{${fg[green]}%}%n%(!,#,$)%{${fg[default]}%} " # color %{${fg[color]}%}
else
    PS1='%n%(!,#,$) ' # non color
fi

#! right prompt
if [ "$COLOR_P" = "t" ]; then
    RPS1="%{${fg[green]}%}%m[%h]%{${fg[default]}%}" # history n
else
    RPS1='%m[%h]' # history n
fi

#RPS1='' # nothing
#RPS1='[%w %T]' # time

#! command correct prompt
#$SPROMPT=correct: '%R' -> '%r' [nyae]?

if [ "$SHELL" = '/usr/bin/zsh' ]
then
    case $TERM in
        rxvt|*term)
            precmd() { print -Pn "\e]0;%n@%m - %~\a" }
            preexec () { print -Pn "\e]0;%n@%m - $1\a" }
            ;;
    esac
fi

##############################
# プロンプトに VCS の情報を表示する。
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%r|%b]'
zstyle ':vcs_info:*' actionformats '[%r|%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# Local variables:
# mode: sh
# coding: euc-jp
# End:
