(require 'cask)
(cask-initialize)

(require 'use-package)

(use-package init-loader
  :init (init-loader-load "~/.emacs.d/inits"))
