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

; Rails�Ѥ�projectile-mode��ͭ���ˤ��롣
(require 'projectile)
(projectile-global-mode)

(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(add-hook 'ruby-mode-hook 'flycheck-mode)
; TODO: �ʲ����ɲá�
; * ruby-rubocop

; �ե��������¸���� brakeman �ǥ����å����롣
; TODO: Rails�ǤΤ�ư����������ǽ�Ǥ���С�ruby -c����ʬ�ϸ���ư��ˤ��롣
(flycheck-define-checker ruby
  "A Ruby Syntax cheker/A Ruby on Rails vulnerability checker using brakeman."
  :command ("~/.emacs.d/scripts/rb-audit.sh" source-original)
  :error-patterns ((error line-start
                          (file-name) ":" line ":" (message) line-end)
                   (error line-start
                          "SyntaxError in " (file-name) ":" line ": "
                          (message) line-end)
                   (warning line-start
                            (file-name) ":" line ":" (optional column ":")
                            " warning: " (message) line-end))
  :modes (enh-ruby-mode ruby-mode))
