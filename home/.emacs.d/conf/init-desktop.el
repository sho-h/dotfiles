;; desktop.el
; M-x desktop-save で状態を保存、呼び出しは M-x desktop-read
(desktop-load-default)
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)
(desktop-read)
(setq desktop-enable t)
