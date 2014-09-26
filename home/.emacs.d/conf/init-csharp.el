; = 概要
;
; csharp-mode を有効にする。
;

(require 'csharp-mode)
(setq auto-mode-alist
  (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

; タブ幅を 2 文字にする。
(setq csharp-mode-hook
  '(lambda ()
    (setq tab-width 2)
   ))
