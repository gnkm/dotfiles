;;; 10_env.el --- environment variables configurations

;;; Commentary:
;; environment variables configurations

;;; Code:

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; use same PATH in .zshrc
(exec-path-from-shell-initialize)

;;矩形編集を使えるようにする
(cua-mode t)			;cua-modeオン
(setq cua-enable-cua-keys nil)	;CUAキーバインドを無効にする

;; 単語移動の設定変更
;; 参考：http://smallsteps.seesaa.net/article/123661899.html
;; 文字カテゴリの作成
(define-category ?U "Upper case")
(define-category ?M "Lower case")
;; 文字の登録
(modify-category-entry (cons ?A ?Z) ?U)
(modify-category-entry (cons ?a ?z) ?M)
;; 小文字の後の大文字を単語境界とする
(add-to-list 'word-separating-categories (cons ?M ?U))

;; ビープ音を無効に
(setq ring-bell-function 'ignore)

;; save 前に行末空白文字を削除する
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; SKK 設定ファイルディレクトリ
(setq skk-user-directory "~/.emacs.d/skk")
(setq skk-init-file (concat skk-user-directory "/init.el"))

;;; 10_env.el ends here
