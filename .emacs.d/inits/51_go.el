(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(setq-default tab-width 8)

;(add-hook 'go-mode-hook 'go-eldoc-setup)
;(set-face-attribute 'eldoc-highlight-function-argument nil
;                    :underline t :foreground "green"
;                    :weight 'bold)
