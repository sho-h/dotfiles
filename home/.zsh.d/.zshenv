############################################################
# Z shell resource file
# - allways run this file
#
# $Id$
############################################################

#! command path
path=(
$HOME/local/bin
$HOME/local/sbin
$HOME/bin
/sbin
/bin
/usr/sbin
/usr/bin
/usr/local/sbin
/usr/local/bin
/usr/X11R6/bin
)

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#! command history
SAVEHIST=150000
HISTSIZE=150000
HISTFILE=~/.zhistory

#! CVS
export CVSROOT=~/cvs
export CVSEDITOR=vi
export CVS_RSH=ssh

#! vi is standard editor. (Debian Policy Manual)
export EDITOR=vi

#! new file mask
umask 022

#! LANG
#export LANG=ja_JP.eucJP
#export LANG=C

#! $PAGER=jless
if [ "$TERM" = "linux" -o "${TERM%-*}" = "xterm" ]
then
  export JLESSCHARSET=latin1
else
  export JLESSCHARSET=japanese
fi

export PAGER=lv

#! perl output warning for locale
#export PERL_BADLANG=0

#! less action
#export LESS=-M

#! append pkg-config
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

# http://qiita.com/y_310/items/101ef023124072b9c73f
case ${OSTYPE} in
  darwin*)
    # http://qiita.com/y_310/items/101ef023124072b9c73f
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
    ;;
  linux*)
    #ここにLinux向けの設定
    ;;
esac
