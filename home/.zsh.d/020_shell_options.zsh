#! logout Control-D
setopt ignore_eof
#setopt no_ignore_eof

#! file over write
setopt no_clobber

#! command correct
setopt correct
#setopt correct_all

# history変数がMac上のzshで履歴検索した場合に時刻が履歴に含まれてしまうため無効にした。
#! extended command completion
# setopt extended_history

#setopt append_history
#setopt inc_append_history
setopt share_history

# コマンド行からヒストリリストに追加されたものが古いものと全く同じ場合
# に、古いものをリストから削除する(それが直前のイベントでなくても)。
setopt hist_ignore_all_dups
# ヒストリファイルに書き出すときに、古いコマンドと同じものは無視する。
setopt hist_save_nodups
setopt hist_ignore_dups

#setopt hist_reduce_blanks

#setopt hist_no_store

setopt hist_ignore_space

# Local variables:
# mode: sh
# coding: utf-8
# End:
