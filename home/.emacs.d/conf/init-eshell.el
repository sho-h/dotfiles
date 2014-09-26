;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; eshell
(setq eshell-ask-to-save-history (quote always))
(setq eshell-history-size 10000)
(setq eshell-ls-dired-initial-args (quote ("-h")))
(setq eshell-ls-exclude-regexp "~\\'")
(setq eshell-ls-initial-args "-h")
;;(setq eshell-ls-use-in-dired t nil (em-ls))
(setq eshell-modules-list
      '(eshell-alias eshell-basic eshell-cmpl eshell-dirs eshell-glob
                     eshell-hist eshell-ls eshell-pred eshell-prompt
                     eshell-script eshell-smart eshell-term
                     eshell-unix eshell-xtra))
;;(setq eshell-prefer-to-shell t nil (eshell))
(setq eshell-stringify-t nil)
(setq eshell-term-name "ansi")
(setq eshell-visual-commands
      '("vi" "top" "screen" "less" "lv" "lynx" "rlogin" "telnet"))

(setq eshell-first-time-mode-hook ;; do not set eshell-mode-hook
      '(lambda ()
         (define-key eshell-mode-map [(control ?a)] 'eshell-bol)))

;; switch eshell buffer after split window
(defun switch-shell-other-window ()
  (interactive)
  (if (or (not (equal "*eshell*" (buffer-name)))
          (window-dedicated-p (selected-window)))
      (progn
        (split-window-vertically)
        (other-window 1)
        (eshell))
    (eshell)))

(global-set-key "\C-c\C-x\C-s" 'switch-shell-other-window)

