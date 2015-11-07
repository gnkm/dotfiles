;;; 50_keybindings.el --- keybindings configurations

;;; Commentary:
;; keybindings configurations

;;; Code:

;; C-h でバックスペース
(global-set-key (kbd "C-h") 'delete-backward-char)
;; C-? でヘルプ
(global-set-key (kbd "C-x ?") 'help-command)

;;; 50_keybindings.el ends here
