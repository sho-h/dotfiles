; = ����
;
; ruby-mode ���ѻ��ΰʲ��������Ԥ���
;
; * style ������
;
; �ʤ���ruby-mode ����Ѥ��뤿��ˤϡ��ʲ��Υ��ޥ�ɤ� elisp �򥤥󥹥ȡ�
; �뤷�Ƥ�����
;
; $ sudo aptitude install ruby-elisp
;

; ruby ��ȯ�� c-mode �����ꡣ
; http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=view;name=Emacs
(c-add-style
 "ruby"
 '("bsd"
   (c-basic-offset . 4)
   (c-offsets-alist
    (case-label . 2)
    (label . 2)
    (statement-case-intro . 2)
    (statement-case-open . 2)
    )))

; end ���б�����Ԥ�狼��䤹�����롣
; c.f. http://d.hatena.ne.jp/khiker/20071130/emacs_ruby_block
; (require 'ruby-block)
; (ruby-block-mode t)
; �б�����Ԥ򥪡��Х쥤ɽ���ǥϥ��饤�Ȥ��롣
; (setq ruby-block-highlight-toggle 'overlay)

; .rake �� ruby-mode �ǳ���
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

; magic-comment������������
(setq ruby-insert-encoding-magic-comment nil)
