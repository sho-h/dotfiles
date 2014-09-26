; = 概要
;
; るびきちさんが作成された auto-install.el を有効にする。
;
; = 参照
;
; http://www.emacswiki.org/emacs/download/auto-install.el
;
; = 使い方
;
; 以下のようにして使用する。(るびきちさんの文章のコピペ)
;
; * M-x install-elisp → URLを指定してインストールする
; * M-x install-elisp-from-emacswiki → EmacsWikiにあるEmacsLispをインストール
; * M-x install-elisp-from-gist → gistIDを指定してインストール

(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)             ; 互換性確保
