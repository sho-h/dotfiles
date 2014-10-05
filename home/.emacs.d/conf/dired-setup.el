;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dired mode setup
;; $Id: dired-setup.el,v 1.1.1.1 2004/02/10 00:12:13 kouji Exp $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load "dired"
  (function
   (progn
     (define-key dired-mode-map "U" 'dired-unmark-all-marks)
     (define-key dired-mode-map "\C-ca" 'dired-mark-subdir-files)
     (define-key dired-mode-map "\C-c\C-m" 'compile)
     (define-key dired-mode-map "\C-c\C-c" 'dired-mark-c-files)
     (define-key dired-mode-map "\C-c\C-p" "*%\\.\\(cpp\\|hpp\\)$")
     (define-key dired-mode-map "\C-c\C-b" "*%\\.CBL$")
     (define-key dired-mode-map "\C-c\C-e" "*%\\.el$")
     (define-key dired-mode-map "\C-c\C-l" "*%\\.elc$")
     (define-key dired-mode-map "\C-c\C-s" "*%\\.scm$")
     (define-key dired-mode-map "\C-c\C-o" "*%\\.go$")
     (define-key dired-mode-map "\C-c\C-i" "*%\\.texi$")
     (define-key dired-mode-map "\C-c\C-j" "*%\\.java$")
     (define-key dired-mode-map "\C-c\C-d"
       "*%\\(\\.\\(aux\\|dvi\\|log\\)\\|~\\)$")
     (define-key dired-mode-map "\C-c\C-u" 'cvs-update)
     (define-key dired-mode-map [(control .)] 'next-error)
     )))

;; mark *.c, *.h , *.y, *.l
;; if *.y, don't mark *.c, *.h
;; if *.l, don't mark *.c
(defun dired-mark-c-files ()
  (interactive)
  (dired-mark-files-regexp "\\.[ch]$")
  (save-excursion
    (dolist (file (directory-files dired-directory))
      (when (string-match "\\.[yl]$" file)
	(let* ((pattern (if (string-match "\\.l$" file) "\\.c$" "\\.[ch]$"))
	       (c-file (replace-match pattern t t file)))
	  (goto-char (point-min))
	  (if (search-forward file nil t)
	      (dired-mark 1))
	  (goto-char (point-min))
	  (while (re-search-forward c-file nil t)
	    (dired-unmark 1)))))))
