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
   color-theme-sanityinc-solarized
   enh-ruby-mode
   rspec-mode
   inf-ruby
   flx-ido
   ido-vertical-mode
   magit
   projectile
   projectile-rails
   chruby
   yasnippet
   gist
   move-text
   ample-theme
   web-mode
   sublime-themes))

;; Initialize ido mode
(require 'init-ido)

;; Initialize magit mode
(require 'init-magit)

;; Initialize ruby mode
(require 'init-ruby)

;; Initialize scheme mode
(require 'init-scheme)

;; Initialize yasnippets
(require 'init-yasnippets)

;; Initialize web mode
(require 'init-web-mode)

;; Start an emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

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
             '(font . "Terminus-13"))

(set-default-font "Terminus-13")

;; Turn off tab indentation and use 2 spaces for width
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

(load-theme 'granger t)

;; Show the file name and path in the frame's title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Use ibuffer
(defalias 'list-buffers 'ibuffer)
