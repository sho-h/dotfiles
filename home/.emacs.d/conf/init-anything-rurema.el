; = 概要
;
; るびきちさんが作成された anything-rurima.el を有効にする。
;
; = 参照
;
; http://d.hatena.ne.jp/rubikitch/20091223/rurima
; http://www.emacswiki.org/cgi-bin/wiki/download/anything-rurima.el
;
; = 使い方
;
; まずは以下を実行して auto-install でのインストールを行う。
;
;   M-x install-elisp-from-emacswiki anything-rurima.el
;
; あとは以下のようにして使用する。(るびきちさんの文章のコピペ)
;
; * M-x anything-rurima でプロンプトが出てくるのでマニュアルを検索する
; * M-x anything-rurima-at-point でカーソル位置の単語をるりまで検索する
;   ことができる。これはメソッド名をタイプして引数を忘れたときに有用だ。
; * C-zで別窓でマニュアルを表示するので、マニュアルをチラっと見た後C-g
;   でキャンセルしよう。

(require 'anything-rurima)
(setq anything-rurima-index-file "~/local/src/rubydoc/doctree/rurima.e")
