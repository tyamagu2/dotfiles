(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(setq-default tab-width 4)
