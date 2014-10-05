; = 概要
;
; migemo を有効にする。
;
; 以前は Debian などでは migemo パッケージにて migemo.el と migemo コマ
; ンドが提供されていたが、最近の Ruby では migemo コマンドが動かなくなっ
; たらしく、cmigemo が開発された。そのため、migemo コマンドを設定してい
; る。

(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
)

(when (eq system-type 'darwin)
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict"))
