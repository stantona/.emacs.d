(chruby "ruby-1.9.3-p484")

(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.pryrc\\'" . ruby-mode))

(defun ruby-insert-dbg (s)
  "Insert a ruby debug statement at the cursor."
  (interactive "sAdditional log info: ")
  (insert "puts \"\\n\\nDBG: in #{self.class.name}:#{__method__}: " s "\"")
  (beginning-of-line-text))

(eval-after-load 'ruby-mode
                 '(define-key ruby-mode-map (kbd "C-x +") 'ruby-insert-dbg))

(provide 'init-ruby)
