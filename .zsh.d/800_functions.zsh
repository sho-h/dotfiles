
# ALC で英単語を検索する。
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
  if [ $# != 0 ]; then # 引数が存在すれば
    for i in $*; do
      str="$str+$i"
    done
    str=`echo $str | sed 's/^\+//'` #先頭の「+」を削除
    opt='search?num=50&hl=ja&ie=euc-jp&oe=euc-jp&lr=lang_ja'
    opt="${opt}&q=${str}"
  fi
  w3m http://www.google.co.jp/$opt #引数がなければ $opt は空になる
  # mozilla -remote openURL\(http::/www.google.co.jp/$opt\) # 未テスト
}

# Local variables:
# mode: sh
# coding: euc-jp
# End:
