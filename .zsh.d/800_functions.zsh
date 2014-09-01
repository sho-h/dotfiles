
# ALC �Ǳ�ñ��򸡺����롣
# $ alc <word>
function alc() {
  if [ $# != 0 ]; then
    w3m "http://eow.alc.co.jp/$1/UTF-8/?ref=sa"
  else
    print "usage: alc <word>"
  fi
}

function google() {
  local str opt
  if [ $# != 0 ]; then # ������¸�ߤ����
    for i in $*; do
      str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'` #��Ƭ�Ρ�+�פ���
    opt='search?num=50&hl=ja&ie=euc-jp&oe=euc-jp&lr=lang_ja'
    opt="${opt}&q=${str}"
  fi
  w3m http://www.google.co.jp/$opt #�������ʤ���� $opt �϶��ˤʤ�
  # mozilla -remote openURL\(http::/www.google.co.jp/$opt\) # ̤�ƥ���
}

# Local variables:
# mode: sh
# coding: euc-jp
# End:
