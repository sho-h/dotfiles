# subversion ��Ϣ������ʤɡ�

# alias �Ȥϰۤʤꡢ\svn �ǽ���� svn �������ʤ����ᡢ\svn �� alias ��
# �Ѱդ��롣
alias "\svn=`echo =svn`"

# svn st ���� --ignore-externals ��������ɲä��롣
# $ svn st ... (=> svn st ... --ignore-externals)
# $ svn ci ... (=> ���Τޤ�)
function svn() {
  local svn_command
  # TODO: �⤦�����ɤ������򤹤롣
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
