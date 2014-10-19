;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path user-emacs-directory)

;; Remove flash screen for heavens sake...
(setq inhibit-startup-message t)

(require 'init-packages)

;; Install packages (if they aren't already installed)
(packages-install
 '(ag
   inf-ruby
   flx-ido
   ido-vertical-mode
   magit
   projectile
   projectile-rails
   rspec-mode
   chruby
   yasnippet
   gist
   move-text))

;; Initialize ido mode
(require 'init-ido)

;; Initialize magit mode
(require 'init-magit)

;; Initialize ruby mode
(require 'init-ruby)

;; Initialize scheme mode
(require 'init-scheme)

;; Start an emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

(yas-global-mode 1)

(move-text-default-bindings)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; set projectile global mode
(projectile-global-mode)

;; set projectile for certain modes
(add-hook 'ruby-mode-hook 'projectile-on)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

;; display line numbers in the margin
(global-linum-mode 1)

;; Set the font
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono"))

;; Turn off tab indentation and use 2 spaces for width
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

(load-theme 'sanityinc-solarized-dark t)

;; Use ibuffer
(defalias 'list-buffers 'ibuffer)

;; For setting up utf-8-unix encoding for process output.
;; This is particularly necessary for ansi-terminal mode.
(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
