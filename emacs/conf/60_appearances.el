;;; 60_appearances.el --- appearances configurations

;;; Commentary:
;; appearances configurations

;;; Code:

;;; ===== メインバッファ =====
(load-theme 'zenburn t)

;; 行番号を常に表示
(global-linum-mode t)
(setq linum-format "%4d")
;; 対応する括弧を表示
(show-paren-mode t)
(use-package rainbow-delimiters)
;; カーソルの点滅をやめる
(blink-cursor-mode 0)

(use-package rainbow-mode)

;; 現在行と桁をハイライト
(use-package crosshairs
  :config
  (crosshairs-mode 1)
  (set-face-background 'hl-line "dim gray")
  (set-face-background 'col-highlight "dim gray"))

;; 折り返し表示する
(setq truncate-lines t)

;; ediff 関連のバッファを 1つのフレームにまとめる
(setq ediff-window-setup-function 'ediff-setup-window-plain)
;; font => サブプラットフォームごとに設定

;; ダイアログボックスを使わない
(setq use-dialog-box nil)

(use-package whitespace
  :config
  (setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))
  (setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  (global-whitespace-mode 1)

  ;; zenburn-bg+1
  (defvar my/bg-color "#4F4F4F")
  ;; zenburn-magenta
  (defvar my/fg-color "#DC8CC3")
  (set-face-attribute 'whitespace-tab nil
                    :foreground my/fg-color
                    :background my/bg-color))
;;; ===== モードライン =====
;; カーソルのある関数を表示する
(which-function-mode 1)

;;; ===== フレーム =====
;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")
;; メニューバー非表示
(menu-bar-mode 0)
;; ツールバー非表示
(tool-bar-mode 0)

;;; 60_appearances.el ends here
