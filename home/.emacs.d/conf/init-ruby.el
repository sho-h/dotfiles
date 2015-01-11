; = 概要
;
; ruby-mode 使用時の以下の設定を行う。
;
; * style の設定
;
; なお、ruby-mode を使用するためには、以下のコマンドで elisp をインストー
; ルしておく。
;
; $ sudo aptitude install ruby-elisp
;

; ruby 開発用 c-mode の設定。
; http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=view;name=Emacs
(c-add-style
 "ruby"
 '("bsd"
   (c-basic-offset . 4)
   (c-offsets-alist
    (case-label . 2)
    (label . 2)
    (statement-case-intro . 2)
    (statement-case-open . 2)
    )))

; end に対応する行をわかりやすくする。
; c.f. http://d.hatena.ne.jp/khiker/20071130/emacs_ruby_block
; (require 'ruby-block)
; (ruby-block-mode t)
; 対応する行をオーバレイ表示でハイライトする。
; (setq ruby-block-highlight-toggle 'overlay)

; .rake を ruby-mode で開く
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

; magic-commentの挿入を抑制
(setq ruby-insert-encoding-magic-comment nil)
