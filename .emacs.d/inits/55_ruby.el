(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

(setq ruby-insert-encoding-magic-comment nil)

(autoload 'ruby-mode "enh-ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . enh-ruby-mode))

(defadvice enh-ruby-mode-set-encoding (around stop-enh-ruby-mode-set-encoding)
  "If enh-ruby-not-insert-magic-comment is true, stops enh-ruby-mode-set-encoding."
  (if (and (boundp 'enh-ruby-not-insert-magic-comment)
           (not enh-ruby-not-insert-magic-comment))
      ad-do-it))
(ad-activate 'enh-ruby-mode-set-encoding)
(setq-default enh-ruby-not-insert-magic-comment t)

(require 'ruby-electric)
(add-hook 'enh-ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(require 'rspec-mode)
(custom-set-variables '(rspec-use-rake-flag nil))
(global-set-key (kbd "C-c s") 'rspec-verify-single)
(global-set-key (kbd "C-c a") 'rspec-verify-all)
(global-set-key (kbd "C-c v") 'rspec-verify)

(add-hook 'enh-ruby-mode-hook 'flycheck-mode)

;; smart-compile
(require 'smart-compile)
(setq smart-compile-alist
      (append
       '(("\\.rb$" . "ruby %f"))
       smart-compile-alist))
(global-set-key (kbd "C-c c") 'smart-compile)
(global-set-key (kbd "C-c C-c") (kbd "C-c c C-m"))


;;web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))


(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\.js$" . js2-mode))
(add-to-list 'load-path "~/.npm/jshint-mode")
(require 'flymake-jshint)
(add-hook 'js2-mode-hook
               (lambda () (flymake-mode t)))


(defun coffee-custom ()
    "coffee-mode-hook"
       (set (make-local-variable 'tab-width) 2)
           (setq coffee-tab-width 2))

(add-hook 'coffee-mode-hook
            '(lambda() (coffee-custom)))


(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)
   )
  )
(add-hook 'scss-mode-hook
  '(lambda() (scss-custom)))
