;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 日本語表示の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (featurep 'mule)
    (progn
      (set-language-environment "Japanese")
      (prefer-coding-system 'euc-jp-unix)
      (set-keyboard-coding-system 'euc-jp-unix)
      (if (not window-system) (set-terminal-coding-system 'euc-jp-unix))
      ;;
      ))
; 日本語 info が文字化けしないように
(auto-compression-mode t)
; xemacs の shell-mode で 日本語 EUC が使えるようにする
(if (featurep 'xemacs)
    (add-hook 'shell-mode-hook (function
       (lambda () (set-buffer-process-coding-system 'euc-japan 'euc-japan))))
)
; 日本語 grep
(if (file-exists-p "/usr/bin/lgrep")
    (setq grep-command "lgrep -n ")
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 漢字変換 (skk) の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(set-input-method "japanese-skk")
;(toggle-input-method nil)
; ---- language-env end DON'T MODIFY THIS LINE!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yc-el による入力
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(load-library "yc")
;(global-set-key "\C-o" 'toggle-input-method)    ;; key binding
;(global-set-key "\C-\\" nil)
;(define-key yc-edit-mode-map "\C-h" 'yc-edit-backward-delete-char)
;(global-yc-mode)                  ;; enable ANK-漢字変換を常に利用
;;
;(setq yc-server-host "localhost") ;; canna server
;(setq yc-canna-lib-path "/usr/lib/canna/") ;; path to "default.canna"
;(setq yc-canna-dic-path "/usr/lib/canna/dic") ;; path to dictionary
;(setq yc-select-count 2) ;; transform table
;(setq yc-use-color t) ;; color mode
;(setq yc-use-fence t) ;; fence mode
;(setq yc-stop-chars "!?(){}<>") ;; character list of not transform
;(setq yc-rK-trans-key [?\C-\;])

;(define-key its-mode-map "\C-h" 'its-delete-backward-SYL)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mac用フォント設定
;; c.f. http://minus9d.hatenablog.com/entry/20131103/1383475472
;; c.f. http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (eq system-type 'darwin)
  ;; 英語
  (set-face-attribute 'default nil
             :family "Menlo" ;; font
             :height 120)    ;; font size

  ;; 日本語
  (set-fontset-font nil 'japanese-jisx0208
    (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

  ;; 半角と全角の比を1:2にしたければ
  (setq face-font-rescale-alist
      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2))));; Mac用フォント設定
