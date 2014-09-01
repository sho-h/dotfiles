# subversion 関連の設定など。

# alias とは異なり、\svn で従来の svn が扱えないため、\svn の alias を
# 用意する。
alias "\svn=`echo =svn`"

# svn st 時に --ignore-externals を引数に追加する。
# $ svn st ... (=> svn st ... --ignore-externals)
# $ svn ci ... (=> そのまま)
function svn() {
  local svn_command
  # TODO: もう少し良い書き方をする。
  svn_command=`echo =svn`
  if [ $# != 0 ]; then
    case "$1" in
      st|status)
        $svn_command $* --ignore-externals
        ;;
      *)
        $svn_command $*
        ;;
    esac
  else
    $svn_command $*
  fi
}

# Local variables:
# mode: sh
# coding: euc-jp
# End:
