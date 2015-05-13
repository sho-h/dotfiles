# dashを起動する関数群。

# TODO: Macでは動作したがLinuxでどうかを確認する。
case ${OSTYPE} in
  darwin*)
    # dashでるりまを検索する。
    function dash.rurema_2.1() {
      open "dash://r21:$1"
    }

    function dash.rurema_2.2() {
      open "dash://r22:$1"
    }

    # dashでRuby on Railsを検索する。
    function dash.rails() {
      open "dash://rails:$1"
    }

    # dashで.NET Frameworkを検索する。
    function dash.net() {
      open "dash://net:$1"
    }
    ;;
esac

# Local variables:
# mode: sh
# coding: utf-8
# End:
