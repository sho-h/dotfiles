; = 概要
;
; auto-complete.el を有効にする。
;
; = 参照
;
; * Software Design 2010年 1月号
; * http://www.emacswiki.org/emacs/AutoComplete
; * http://github.com/m2ym/auto-complete/tree/v1.0
;

(when (require 'auto-complete nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict.auto-complete/")
  (require 'auto-complete-config)
  (ac-config-default)

  ; グローバルで auto-complete を使用する。
  (global-auto-complete-mode t)

  ; C-n、C-p で次、前の候補を選択する。
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)

  ; TAB キーで補完を完了する。
  (define-key ac-completing-map (kbd "TAB") 'ac-complete)

  ; 候補が1つしかない時にタブキー押下で補完を完了する。
  ; 次 / 前候補を選んだ時にタブキー押下で補完を完了する。
  ; 補完後にメニューを自動的に非表示にする。
  (setq ac-dwim t)

  ; 情報源として以下を利用する。
  ; * ac-source-filename
  ; * ac-source-words-in-buffer
  (setq-default ac-sources '(ac-source-filename ac-source-words-in-buffer))

  ; 自動補完を無効にする。
  (setq ac-auto-start nil)

  ; 3文字目から自動補完を有効にする。
  (setq ac-auto-start 3)

  ; TODO: EmacsWiki にある以下の設定例について確認して有効にするかどう
  ; かを決める。Software Design 2010年 2月号で紹介予定なのかも。
  ;(require 'auto-complete-yasnippet)
  ;(require 'auto-complete-ruby)
  ;(require 'auto-complete-css)
)
