; = ����
;
; RSense ��ͭ���ˤ��롣�ޤ������ޤ򻲾ȤǤ���褦�ˤ��롣
;
; = ����
;
; * Software Design 2010ǯ 10���
; * http://cx4a.org/software/rsense/
;

(setq rsense-home (expand-file-name "~/local/src/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

; C-c .���䴰
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)))

; . �� :: �����Ϥ���ľ��˼�ưŪ���䴰�򳫻�
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

; ���ޤ򻲾�
(setq rsense-rurema-home (expand-file-name "~/local/src/refm"))
