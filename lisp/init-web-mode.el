(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun ajs-web-mode-hook ()
  "Hooks for web mode"
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
)

(add-hook 'web-mode-hook 'ajs-web-mode-hook)
(add-hook 'web-mode-hook 'projectile-mode)
(provide 'init-web-mode)
