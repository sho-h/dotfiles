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
; (flycheck-define-checker rails-brakeman
(flycheck-define-checker ruby
  "A Ruby on Rails vulnerability checker using brakeman."
  ; source-original�ǤϤʤ�source�ˤ�����硢�����Υե�����Τ߰���ե�
  ; ����Ȥ��ƥ��ԡ������brakeman�¹Ի���Rails���ץ�Ȥ���ǧ�����Ƥ��
  ; ���ʤ������Τޤޤ���û���֤�(����Ū�ˤ�brakeman�����������)������
  ; ����¸��������꤬�����ǽ�������뤬�����������롣
  ; TODO: /tmp/check-brakeman.sh�ϰʲ��Τ褦�����ƤΥե����롣���Τޤ�
  ; ���ȥ������ΤǤ⤦�����褤���Ƥˤ��롣
  ;    #!/bin/sh
  ;
  ;    export PATH="/usr/local/bin/:$PATH"
  ;    eval "$(rbenv init - zsh)"
  ;
  ;    rails_root=`bundle exec rake about | grep "Application root" | awk '{print $3}'`
  ;    if [ "x${rails_root}" != "x" ]; then
  ;      bundle exec brakeman ${rails_root} -f json | ruby -r json -e 'JSON.parse(STDIN.read)["warnings"].collect {|h| path = h["file"].gsub(File.dirname(h["file"]), File.dirname(ARGV[0])); [path, h["line"], h["warning_type"], h["message"]].join(":")}.each {|s| STDERR.puts s}' $1
  ;      exit 1
  ;    fi
  :command ("/tmp/check-brakeman.sh" source-original)
  :error-patterns  ((error line-start
                           (file-name) ":" line ":" (message)
                           line-end))
  :modes (ruby-mode))
