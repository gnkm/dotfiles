(require 'cl)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
