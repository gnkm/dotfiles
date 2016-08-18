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
