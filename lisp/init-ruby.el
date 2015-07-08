(chruby "2.1.4")

;; Enable pry for rails
(setenv "ENABLE_PRY_RAILS" "1")

(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.pryrc\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.irbrc\\'" . ruby-mode))

(add-hook 'ruby-mode-hook 'projectile-mode)

(provide 'init-ruby)
