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
;; カーソルの点滅をやめる
(blink-cursor-mode 0)

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
