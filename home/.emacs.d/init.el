; exec-path��/usr/local/bin���ɲá�
; TODO: ��ǽ�ʤ�ʲ��η����Ȥ���(Spotlight�������zsh���ͳ���ʤ��Τ���
; ����PATH��/usr/local/bin���ޤޤ�ʤ�)
; (setq exec-path (parse-colon-path (getenv "PATH")))
(when (eq system-type 'darwin)
      (setq exec-path
            (cons "/usr/local/bin" exec-path)))

; load-path �������Ԥ���
; http://github.com/aircastle/dot-emacs-dot-d
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-load-path
  "~/.emacs.d/conf" "~/.emacs.d/elisp" "~/.emacs.d/auto-install")

(load "init-japanese")
(load "init-basis")
(load "init-flycheck")
(load "init-c")
(load "init-csharp")
(load "init-ruby")
(load "init-js2")
; (load "init-gpg")
(load "init-wl")
(load "init-eshell")
(load "init-svn")
(load "init-whitespace")
(load "init-swbuff")
(load "init-desktop")
(load "dired-setup")
(load "init-auto-install")
(load "anything-startup")
(load "init-anything-rurema")
(load "init-anything-rcodetools")
(load "init-auto-complete")
(load "init-rsense")
; TODO: region�����ޤ��Ǥ��ʤ��ʤ�Τ������ƺ���ͭ���ˤ��롣
; (load "init-one-key")

; ���ܸ�Υ��󥯥��󥿥븡����Ԥ���
; migemo �Ȱ��˥��󥹥ȡ���Ǥ��롣
(load "init-migemo")

; PDF �ե������ PS �ե������ Emacs ����ɤ��褦�ˤ��롣
; * M-x install-elisp-from-emacswiki doc-view.el
; * M-x doc-view ���� �ե�����̾�����
; * n ���������Ǽ��Υڡ���
; * p �������������Υڡ���
(require 'doc-view)

; TODO: ���꤬������褦�Ǥ���С��̤Υե�����ˤ��롣
; kill-ring ��ɽ���� anything ����Ѥ��롣
(global-set-key "\M-y" 'anything-show-kill-ring)
; 5ʸ���ʾ���䴰���оݤȤ��롣
(setq anything-kill-ring-threshold 5)
