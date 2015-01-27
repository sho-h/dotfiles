; = 概要
;
; ruby-mode 使用時の以下の設定を行う。
;
; * style の設定
;
; なお、ruby-mode を使用するためには、以下のコマンドで elisp をインストー
; ルしておく。
;
; $ sudo aptitude install ruby-elisp
;

; ruby 開発用 c-mode の設定。
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

; end に対応する行をわかりやすくする。
; c.f. http://d.hatena.ne.jp/khiker/20071130/emacs_ruby_block
; (require 'ruby-block)
; (ruby-block-mode t)
; 対応する行をオーバレイ表示でハイライトする。
; (setq ruby-block-highlight-toggle 'overlay)

; .rake を ruby-mode で開く
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

; magic-commentの挿入を抑制
(setq ruby-insert-encoding-magic-comment nil)

; Rails用にprojectile-modeを有効にする。
(require 'projectile)
(projectile-global-mode)

(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(add-hook 'ruby-mode-hook 'flycheck-mode)
; TODO: 以下を追加。
; * ruby-rubocop

; ファイルの保存時に brakeman でチェックする。
; (flycheck-define-checker rails-brakeman
(flycheck-define-checker ruby
  "A Ruby on Rails vulnerability checker using brakeman."
  ; source-originalではなくsourceにした場合、該当のファイルのみ一時ファ
  ; イルとしてコピーされてbrakeman実行時にRailsアプリとして認識してもら
  ; えない。このままだと短時間に(具体的にはbrakemanが終わる前に)繰り返
  ; し保存すると問題がある可能性があるが、それは諦める。
  ; TODO: /tmp/check-brakeman.shは以下のような内容のファイル。このまま
  ; だとダサいのでもう少しよい内容にする。
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
