(require 'ido)

(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
(setq ido-uses-faces nil)

;; Fuzzy matching
(setq ido-enable-flex-matching t)

(require 'ido-vertical-mode)
(ido-vertical-mode)

(provide 'init-ido)
