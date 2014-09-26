; = 概要
;
; 行末の空白文字を赤くハイライト表示にする。ただし、w3-modeなどの場合は
; 除外する。
;
; = 参照
;
; http://paste.lisp.org/display/4085

(when (>= emacs-major-version 21)
  (setq-default show-trailing-whitespace t)

  (defun turn-off-show-trailing-whitespace ()
    "Turn on the highlighting of trailing whitespace in this buffer."
    (interactive)
    (setq show-trailing-whitespace nil))

  (defun turn-on-show-trailing-whitespace ()
    "Turn off the highlighting of trailing whitespace in this buffer."
    (interactive)
    (setq show-trailing-whitespace t))

  (defun toggle-show-trailing-whitespace ()
    "Toggle the highlighting of trailing whitespace in this buffer."
    (interactive)
    (setq show-trailing-whitespace
          (not show-trailing-whitespace)))

  ;Turn off the whitespace highlighting in various modes.
  (let ((mode-hooks '(Buffer-menu-mode-hook mail-mode-hook
                                            eshell-mode-hook
                                            w3-mode-hook
                                            mime-view-mode-hook
                                            diff-mode-hook
                                            riece-channel-mode-hook
                                            riece-others-mode-hook)))

    (mapcar '(lambda (mode-hook)
               (add-hook mode-hook 'turn-off-show-trailing-whitespace))
            mode-hooks)))
