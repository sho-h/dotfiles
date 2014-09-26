;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ���ܸ�ɽ��������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (featurep 'mule)
    (progn
      (set-language-environment "Japanese")
      (prefer-coding-system 'euc-jp-unix)
      (set-keyboard-coding-system 'euc-jp-unix)
      (if (not window-system) (set-terminal-coding-system 'euc-jp-unix))
      ;;
      ))
; ���ܸ� info ��ʸ���������ʤ��褦��
(auto-compression-mode t)
; xemacs �� shell-mode �� ���ܸ� EUC ���Ȥ���褦�ˤ���
(if (featurep 'xemacs)
    (add-hook 'shell-mode-hook (function
       (lambda () (set-buffer-process-coding-system 'euc-japan 'euc-japan))))
)
; ���ܸ� grep
(if (file-exists-p "/usr/bin/lgrep")
    (setq grep-command "lgrep -n ")
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �����Ѵ� (skk) ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(set-input-method "japanese-skk")
;(toggle-input-method nil)
; ---- language-env end DON'T MODIFY THIS LINE!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yc-el �ˤ������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(load-library "yc")
;(global-set-key "\C-o" 'toggle-input-method)    ;; key binding
;(global-set-key "\C-\\" nil)
;(define-key yc-edit-mode-map "\C-h" 'yc-edit-backward-delete-char)
;(global-yc-mode)                  ;; enable ANK-�����Ѵ���������
;;
;(setq yc-server-host "localhost") ;; canna server
;(setq yc-canna-lib-path "/usr/lib/canna/") ;; path to "default.canna"
;(setq yc-canna-dic-path "/usr/lib/canna/dic") ;; path to dictionary
;(setq yc-select-count 2) ;; transform table
;(setq yc-use-color t) ;; color mode
;(setq yc-use-fence t) ;; fence mode
;(setq yc-stop-chars "!?(){}<>") ;; character list of not transform
;(setq yc-rK-trans-key [?\C-\;])

;(define-key its-mode-map "\C-h" 'its-delete-backward-SYL)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mac�ѥե��������
;; c.f. http://minus9d.hatenablog.com/entry/20131103/1383475472
;; c.f. http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (eq system-type 'darwin)
  ;; �Ѹ�
  (set-face-attribute 'default nil
             :family "Menlo" ;; font
             :height 120)    ;; font size

  ;; ���ܸ�
  (set-fontset-font nil 'japanese-jisx0208
    (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

  ;; Ⱦ�Ѥ����Ѥ����1:2�ˤ��������
  (setq face-font-rescale-alist
      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2))));; Mac�ѥե��������
