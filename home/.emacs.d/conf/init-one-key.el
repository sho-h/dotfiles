; = 概要
;
; one-key.el などを有効にする。2009/12/27現在はデフォルトのキーバインド
; を one-key 化したものだけしか使うようにしていない。
;
; = 参照
;
; http://d.hatena.ne.jp/rubikitch/20090127/onekey
;
; = 使い方
;
; 以下を実行して auto-install でのインストールを行う。
;
;   M-x install-elisp-from-emacswiki one-key.el
;   M-x install-elisp-from-emacswiki one-key-config.el
;   M-x install-elisp-from-emacswiki one-key-default.el
;
; キー入力をしている時に、入力途中のキーバインドから呼び出し可能な機能
; が候補として表示される。
;
; 例えば、特定の行にカーソル移動する時に M-g g を入力するが、M-g を入力
; した時点でカーソル移動(g)を含む候補が表示される。
;
; 他では例えば以下のキーバインドが表示可能。詳しくはソース参照。
;
; * C-x RET
; * C-x ESC
; * C-x 4
; * C-x 5
; * C-x n
; * C-x r
; * C-x v

(require 'one-key)
(require 'one-key-default)
(one-key-default-setup-keys)
