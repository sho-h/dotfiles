# タブ補完を有効にする。
# http://docs.ruby-lang.org/ja/2.1.0/library/irb=2fcompletion.html
require "irb/completion"

# オートインデントを有効にする。
IRB.conf[:AUTO_INDENT] = true

# ヒストリを~/.irb_historyに保存する。ヒストリの件数を10000件にする。
IRB.conf[:SAVE_HISTORY] = 10000

# 1.8.5 以前でヒストリを保存する場合。その場合は、恐らく gem install
# irb-history が必要になる。
if RUBY_VERSION < "1.8.5"
  require 'irb-history'
end

