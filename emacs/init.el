(require 'cl)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; add-to-load-path を使えるようにする
(add-to-list 'load-path "~/.emacs.d/elisp")

(require 'add-to-load-path)
(add-to-load-path "public_repos")
