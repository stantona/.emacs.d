(add-to-list 'auto-mode-alist '(".cliorc" . shell-script-mode))
(add-to-list 'auto-mode-alist '(".bashrc" . shell-script-mode))
(add-to-list 'auto-mode-alist '(".bash_aliases" . shell-script-mode))

(defun setup-shell-script-mode ()
  "Sets up indentation for shell script mode"

  (interactive)
  (setq
   sh-basic-offset 4
   sh-indentation 4))

(add-hook 'sh-mode-hook 'setup-shell-script-mode)

(provide 'init-shell)
