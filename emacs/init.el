(setq gc-cons-threshold (* 256 1024 1024))

(require 'cl)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; add-to-load-path を使えるように
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'add-to-load-path)
(add-to-load-path "vendor")

;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
