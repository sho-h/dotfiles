; = 概要
;
; anything-rcodetools.el を有効にする。
;
; = 参照
;
; http://d.hatena.ne.jp/keyword/rcodetools
; http://www.emacswiki.org/cgi-bin/wiki/download/anything-rcodetools.el
;
; = 使い方
;
; まずは以下を実行して rcodetools のインストールを行い、rcodetools.el
; を load できるパスに配置する。
;
;   $ sudo gem install rcodetools --no-rdoc --no-ri
;
; gem1.9.1 などを使うような特殊な場合には、rcodetools.el の「ruby ...」
; の部分を書き換える。
;
; 次に以下を実行して auto-install でのインストールを行う。
;
;   M-x install-elisp-from-emacswiki anything-rcodetools.el
;
; あとは、M-C-i で Ruby のメソッドの補完ができるようになる。
;

(require 'anything)
(require 'anything-rcodetools)
(defun ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map "\M-\C-i" 'rct-complete-symbol))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)