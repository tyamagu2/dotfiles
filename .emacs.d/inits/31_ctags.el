; ctags -Re to generate TAGS
(setq ctags-update-command "/usr/local/bin/ctags")

(add-hook 'go-mode-hook 'turn-on-ctags-auto-update-mode)
(add-hook 'php-mode-hook 'turn-on-ctags-auto-update-mode)
