; = 概要
;
; steve.yegge さんが作成された js2-mode を有効にする。
;
; = 参照
;
; http://code.google.com/p/js2-mode/
; http://8-p.info/emacs-javascript.html

(setq-default c-basic-offset 2)

(when (load "js2" t)
  ; 行末の空白を削除しない。C-iの度にインデントを変更しない。
  (setq js2-cleanup-whitespace nil
        js2-bounce-indent-flag nil)

  (defun indent-and-back-to-indentation ()
    (interactive)
    (indent-for-tab-command)
    (let ((point-of-indentation
           (save-excursion
             (back-to-indentation)
             (point))))
      (skip-chars-forward "\s " point-of-indentation)))
  (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)

  (define-key js2-mode-map "\C-m" nil)

  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))
