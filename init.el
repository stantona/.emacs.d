;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; Remove flash screen for heavens sake...
(setq inhibit-startup-message t)

(require 'init-packages)

;; Install packages (if they aren't already installed)
(packages-install
 '(ag
   color-theme-sanityinc-solarized
   rspec-mode
   inf-ruby
   flx-ido
   ido-vertical-mode
   projectile-rails
   chruby
   yasnippet
   gist
   move-text
   ample-theme
   web-mode
   sublime-themes
   yaml-mode
   base16-theme
   magit))

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

;; Initialize shell script mode
(require 'init-shell)

;; Start an emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

(move-text-default-bindings)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

;; display line numbers in the margin
(global-linum-mode 1)

;; Set the font
(add-to-list 'default-frame-alist
             '(font . "Monospace-9"))

(set-default-font "Monospace-9")

;; Turn off tab indentation and use 2 spaces for width
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

(load-theme 'base16-solarized-light t)

;; Show the file name and path in the frame's title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Use ibuffer
(defalias 'list-buffers 'ibuffer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("cda6cb17953b3780294fa6688b3fe0d3d12c1ef019456333e3d5af01d4d6c054" "6ebb2401451dc6d01cd761eef8fe24812a57793c5ccc427b600893fa1d767b1d" "7545d3bb77926908aadbd525dcb70256558ba05d7c478db6386bfb37fb6c9120" "27890155f81d23512a9933f4ac6110e94de6266e948fd464eda3423c799713e2" "17f35b689dd41e49cb740bfb810ac8a53d13292cbebf68f41f772787d8b3aebf" "c537bf460334a1eca099e05a662699415f3971b438972bed499c5efeb821086b" "e3c90203acbde2cf8016c6ba3f9c5300c97ddc63fcb78d84ca0a144d402eedc6" "7b7ef508f9241c01edaaff3e0d6f03588a6f4fddb1407a995a7a333b29e327b5" "a0fdc9976885513b03b000b57ddde04621d94c3a08f3042d1f6e2dbc336d25c7" "8f1cedf54f137f71382e3367e1843d10e173add99abe3a5f7d3285f5cc18f1a9" "2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" "8022cea21aa4daca569aee5c1b875fbb3f3248a5debc6fc8cf5833f2936fbb22" "0ed983facae99849805b2f7be926561cb58474eb18e5296d9bb3ad7f9b088a5b" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
