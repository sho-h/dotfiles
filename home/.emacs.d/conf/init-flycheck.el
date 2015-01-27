; = 概要
;
; flycheckの設定を行う。ただし、Rubyにおいてはinit-ruby.elで設定する。
;
; https://github.com/flycheck/flycheck
(require 'flycheck)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(add-hook 'coffee-mode-hook 'flycheck-mode)
(add-hook 'haml-mode-hook 'flycheck-mode)
(add-hook 'scss-mode-hook 'flycheck-mode)
(add-hook 'slim-mode-hook 'flycheck-mode)

; TODO: 以下を追加。
; * coffee-coffeelint
; * css-csslint
