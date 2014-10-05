; = 概要
;
; RSense を有効にする。また、るりまを参照できるようにする。
;
; = 参照
;
; * Software Design 2010年 10月号
; * http://cx4a.org/software/rsense/
;

(setq rsense-home (expand-file-name "~/local/src/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

; C-c .で補完
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)))

; . や :: を入力した直後に自動的に補完を開始
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

; るりまを参照
(setq rsense-rurema-home (expand-file-name "~/local/src/refm"))
