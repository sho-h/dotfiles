(setq user-full-name "Sho Hashimoto")
(setq user-mail-address "sho-h@netlab.jp")

(add-hook 'wl-summary-mode-hook 'mc-install-read-mode)
(add-hook 'wl-mail-setup-hook 'mc-install-write-mode)
(defun mc-wl-verify-signature ()
  (interactive)
  (save-window-excursion
    (wl-summary-jump-to-current-message)
    (mc-verify)))
(defun mc-wl-decrypt-message ()
  (interactive)
  (save-window-excursion
    (wl-summary-jump-to-current-message)
    (let ((inhibit-read-only t))
      (mc-decrypt-message))))
(eval-after-load "mailcrypt"
  '(setq mc-modes-alist
         (append
          (quote
           ((wl-draft-mode (encrypt . mc-encrypt-message)
                           (sign . mc-sign-message))
            (wl-summary-mode (decrypt . mc-wl-decrypt-message)
                             (verify . mc-wl-verify-signature))))
          mc-modes-alist)))
