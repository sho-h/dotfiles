; = 概要
;
; swbuff.el を有効にする。
;
; = 参照
;
; http://sourceforge.net/projects/emhacks/
;
; = 使い方
;
; * C-x , で次のバッファを表示する(本来は C-F6)
; * C-x . で前のバッファを表示する(本来は C-Shift-F6)
;
; C-x . を上書きしたので、fill-prefix が使用できなくなっている事に注意。

(require 'swbuff)
(global-set-key "\C-x," 'swbuff-switch-to-next-buffer)
(global-set-key "\C-x." 'swbuff-switch-to-previous-buffer)
