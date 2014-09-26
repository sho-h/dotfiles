; = 概要
;
; Stefan Reichoer さんが作成された psvn を有効にする。
;
; = 参照
;
; http://www.xsteve.at/prg/emacs/

(require 'psvn)

(add-to-list 'vc-handled-backends 'SVN)
(when (and (boundp 'vc-handled-backends)
           (file-exists-p "/usr/share/emacs/site-lisp/vc-svn.el"))
 (setq vc-handled-backends (append vc-handled-backends (list 'SVN))))

; n、p キーの押下で上下に移動する。
(define-key svn-status-mode-map [?n] 'forward-line)
(define-key svn-status-mode-map [?p] 'previous-line)

; dired-mode で V キーの押下時に svn-status を実行する。
(add-hook 'dired-mode-hook
          '(lambda ()
             (require 'dired-x)
             (define-key dired-mode-map "V" 'svn-status)
             (turn-on-font-lock)
             ))

; svn status 時に変更のないファイルは表示しない。
(setq svn-status-hide-unmodified t)

; psvn が実行する svn コマンドの LANG を UTF-8 にする。
(setq process-coding-system-alist
      (cons '("svn" . utf-8) process-coding-system-alist))
