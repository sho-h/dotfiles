; = ����
;
; csharp-mode ��ͭ���ˤ��롣
;

(require 'csharp-mode)
(setq auto-mode-alist
  (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

; �������� 2 ʸ���ˤ��롣
(setq csharp-mode-hook
  '(lambda ()
    (setq tab-width 2)
   ))
