;; *.c �� *.h �����촹����
(defun c-find-alternate-file ()
  (interactive)
  (if (and buffer-file-name (string-match "\\.[ch]\\'" buffer-file-name))
      (let ((ext (if (equal (match-string 0 buffer-file-name) ".c")
		     ".h" ".c")))
	(find-file (replace-match ext nil nil buffer-file-name)))
    (error "buffer not C file")))

(setq c-mode-hook
      '(lambda ()
	 ;(define-key c-mode-map "\C-c\C-a" 'abbrev-mode)
	 (define-key c-mode-map "\C-c\C-u" 'uncomment-region)
	 (define-key c-mode-map "\C-c\C-b" 'pop-tag-mark)
	 (define-key c-mode-map "\C-c\C-f" 'complete-tag)
	 (define-key c-mode-map "\C-c\C-i" 'unexpand-abbrev)
	 (define-key c-mode-map "\C-c\C-m" 'compile)
	 ;(define-key c-mode-map "\C-c\C-n" 'next-error)
	 (define-key c-mode-map "\C-c\C-o" 'expand-abbrev)
	 (define-key c-mode-map "\C-c\C-a" 'auto-insert)
	 (define-key c-mode-map "\C-c\C-v" 'find-tag)
	 (define-key c-mode-map "\C-c\C-j" 'bookmark-jump)
	 (define-key c-mode-map "\C-c\C-y" 'View-back-to-mark)
	 (define-key c-mode-map "\C-c\C-[" 'backward-page)
	 (define-key c-mode-map "\C-c\C-]" 'forward-page)
	 ;(define-key c-mode-map "\C-c\C-t" 'c-find-alternate-file)
	 (define-key c-mode-map [(control tab)] 'c-find-alternate-file)
	 (define-key c-mode-map [(control .)] 'next-error)
	 (define-key c-mode-map "\C-x\C-o" 'other-window)
	 (define-key c-mode-map [(control \')]
	   (lambda () (interactive) (find-tag nil t)) )
	 (define-key c-mode-map "\C-c\C-l" 'fill-region)

	 ;; indent
	 ;;(setq c-indent-level 4)
	 (setq c-basic-offset 4)
	 (setq indent-tabs-mode nil)
	 )
      )