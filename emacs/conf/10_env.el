;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; バッファ切り替えを強化する
(iswitchb-mode 1)

;; バッファ読取関数を iswitchb にする
(setq read-buffer-function 'iswitchb-read-buffer)

;; 部分文字列のかわりに正規表現を使う場合には t にする
(setq iswitchb-regexp nil)

;; 新しいバッファを作成するときにいちいち聞いてこない
(setq iswitchb-prompt-newbuffer nil)

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
