; = 概要
;
; ruby-mode 使用時の以下の設定を行う。
;
; * style の設定
; * 保存時に自動で magic comment を追加
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

; 保存時に自動でRuby 1.9のmagic commentをつける。
; c.f. http://d.hatena.ne.jp/rubikitch/20080307/magiccomment
(defun ruby-insert-magic-comment-if-needed ()
  "バッファのcoding-systemをもとにmagic commentをつける。"
  (when (and (eq major-mode 'ruby-mode)
             (find-multibyte-characters (point-min) (point-max) 1))
    (save-excursion
      (goto-char 1)
      (when (looking-at "^#!")
        (forward-line 1))
      (if (re-search-forward "^#.+coding" (point-at-eol) t)
          (delete-region (point-at-bol) (point-at-eol))
        (open-line 1))
      (let* ((coding-system (symbol-name buffer-file-coding-system))
             (encoding (cond ((string-match "japanese-iso-8bit\\|euc-j" coding-system)
                              "euc-jp")
                             ((string-match "shift.jis\\|sjis\\|cp932" coding-system)
                              "shift_jis")
                             ((string-match "utf-8" coding-system)
                              "utf-8"))))
        (insert (format "# -*- coding: %s -*-" encoding))))))

; (add-hook 'before-save-hook 'ruby-insert-magic-comment-if-needed)

; end に対応する行をわかりやすくする。
; c.f. http://d.hatena.ne.jp/khiker/20071130/emacs_ruby_block
; (require 'ruby-block)
; (ruby-block-mode t)
; 対応する行をオーバレイ表示でハイライトする。
; (setq ruby-block-highlight-toggle 'overlay)

; .rake を ruby-mode で開く
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
