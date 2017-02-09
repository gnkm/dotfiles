;;; cocoa-emacs-30_keybindings.el --- keybindings for cocoa-emacs

;;; Commentary:
;; keybindings for cocoa-emacs

;;; Code:

;;メタキーをオプションキーに割り当て
(setq mac-option-modifier 'meta)
;; ¥の代わりにバックスラッシュを入力する
(define-key global-map [?¥] [?\\])

;;; cocoa-emacs-30_keybindings.el ends here
