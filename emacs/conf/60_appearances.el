;;; ===== ウインドウ =====
(load-theme 'zenburn t)

;; 行番号を常に表示
(global-linum-mode t)
;; 対応する括弧を表示
(show-paren-mode t)
;; ediff 関連のバッファを 1つのフレームにまとめる
(setq ediff-window-setup-function 'ediff-setup-window-plain)

;;; ===== ミニバッファ =====

;;; ===== モードライン =====

;;; ===== ツールバー =====
;; ツールバー非表示
(tool-bar-mode -1)
