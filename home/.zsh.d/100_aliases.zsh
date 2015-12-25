# エイリアス。

if [ "$COLOR_P" = "t" ]; then
    alias ls='ls --color=auto -h'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
else
    alias ls='ls -h'
    alias dir='ls --format=vertical'
    alias vdir='ls --format=long'
fi

alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
#alias svn='LANG=C svn'
alias psrb='ps ax | grep "[r]uby"'

#alias -g L='| lv'
#alias -g H='| head'
#alias -g T='| tail'
#alias -g G='| grep'
#alias -g W='| wc'
#alias -g S='| sed'
#alias -g A='| awk'
#alias -g W='| wc'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# サフィックス alias。
alias -s pdf=acroread
alias -s dvi=xdvi
alias -s {odt,ods,odp,otp,doc,docx,xls,XLS,xlsx,XLSX,ppt,pptx}=soffice
alias -s {pcap}=wireshark

# typo 用。
alias sl='ls'
alias snv='svn'
alias s='svn'
alias g='git'
alias r='rails'
alias cjp='curl -H "Accept: application/json" -H "Content-type: application/json" -X POST'

# backup files display and remove command
alias chkbackups='/usr/bin/find . -name "?*~" -o -name "?*.bak" -o -name ".[^.]?*~" -o -name ".[^.]?*.bak" -maxdepth 1'
alias rmbackups='chkbackups | xargs rm'

# ディレクトリのエイリアス。
hash -d rubydoc=$HOME/local/src/rubydoc/doctree
hash -d rubysrc=$HOME/local/src/rubysrc
hash -d bookdir=$HOME/local/data/books
hash -d zsh.d=$HOME/.zsh.d/
hash -d emacs.d=$HOME/.emacs.d
case ${OSTYPE} in
  darwin*)
    hash -d dldir=$HOME/Downloads
    hash -d desktop=$HOME/Desktop
    ;;
  linux*)
    hash -d dldir=$HOME/ダウンロード
    hash -d desktop=$HOME/デスクトップ
    ;;
esac

# Local variables:
# mode: sh
# coding: utf-8
# End:
