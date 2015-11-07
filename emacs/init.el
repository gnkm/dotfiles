;;; init.el --- config file for emacs

;;; Commentary:
;; settigs for Emacs

;;; Code:

(setq gc-cons-threshold (* 256 1024 1024))

(require 'cl-lib)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(require 'use-package)

;; add-to-load-path を使えるように
(use-package add-to-load-path
	     :load-path "elisp")

;; init-loader
(use-package init-loader
  :config
  (init-loader-load "~/.emacs.d/conf"))

;;; init.el ends here
