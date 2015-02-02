(chruby "2.1.4")

;; enh-ruby-mode does weird things to encodings on some files
;; sticking with ruby mode for the Gemfile
(add-to-list 'auto-mode-alist '("Gemfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.pryrc\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.irbrc\\'" . enh-ruby-mode))

(provide 'init-ruby)
