;;; init.el --- config file for emacs

;;; Commentary:
;; settigs for Emacs

;;; Code:

(setq gc-cons-threshold (* 256 1024 1024))

(require 'cl-lib)

;; package management
;; use package.el on windows
(when (or
  (eq system-type 'cygwin)
  (eq system-type 'windows-nt))
  (require 'package)
  ;; MELPAを追加
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  ;; MELPA-stableを追加
  (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
  ;; Marmaladeを追加
  (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
  ;; 初期化
  (package-initialize))

;; use cask and pallet on Mac
(when (eq system-type 'darwin)
  (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
  (cask-initialize)
  (require 'pallet)
  (pallet-mode t))

(require 'use-package)

;; add-to-load-path を使えるように
(use-package add-to-load-path
	     :load-path "elisp")

;; init-loader
(use-package init-loader
  :config
  (init-loader-load (concat user-emacs-directory "conf")))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(delete-trailing-whitespece-before-save nil t)
 '(package-selected-packages
   (quote
    (rainbow-mode editorconfig zenburn-theme yasnippet yaml-mode wgrep-ag web-mode vimrc-mode vbasense use-package undo-tree twittering-mode tuareg smartparens rainbow-delimiters quickrun py-autopep8 powerline php-mode pallet mew markdown-mode magit lua-mode js2-mode jinja2-mode init-loader helm-ag haskell-mode gitignore-mode flymake-yaml flycheck fish-mode exec-path-from-shell esup emmet-mode dockerfile-mode ddskk coffee-mode auto-virtualenvwrapper arduino-mode ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
