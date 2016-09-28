;; Turn off mouse interface early in startup to avoid momentary display

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;;

(package-initialize)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(prefer-coding-system 'utf-8-unix)

;; Set alternative location for backup files
(setq temporary-file-directory "~/.backups")
(setq backup-directory-alist
  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))

;; Todo: Put this in its own configuration once it has matured
(require 'helm-config)
(helm-mode 1)

(defvar helm-map)
(defvar helm-split-window-in-side-p t)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-x m") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq helm-split-window-in-side-p t)

(projectile-global-mode)
(defvar projectile-completion-system)
(defvar projectile-enable-caching)
(defvar projectile-indexing-method)

(setq projectile-completion-system 'helm)
(helm-projectile-on)
;;(setq projectile-enable-caching t)
(setq projectile-indexing-method 'alien)

;; Improve scrolling
(setq scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(setq column-number-mode t)

(normal-erase-is-backspace-mode 1)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; Remove flash screen for heavens sake...
(setq inhibit-startup-message t)

(require 'init-packages)

;; Install packages (if they aren't already installed)
(packages-install
 '(avy
   expand-region
   sed-mode
   helm-projectile
   inf-ruby
   chruby
   yaml-mode
   puppet-mode
   base16-theme
   whitespace-cleanup-mode))

;; Initialize ido mode
;;(require 'init-ido)

;; Initialize ruby mode
(require 'init-ruby)

;; Initialize scheme mode
(require 'init-scheme)

;; Initialize shell script mode
(require 'init-shell)

;; Initialize python mode
(require 'init-python)

;; Start an emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; expand region configuration
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; avy configuration
(global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "s-.") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "s-w") 'ace-window)

(global-whitespace-cleanup-mode)
(setq whitespace-style '(lines tabs face trailing))
(global-whitespace-mode 1)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; display line numbers in the margin
(global-linum-mode 1)

;; This fixes a bug with projectile
;; https://github.com/bbatsov/projectile/issues/657
(setq projectile-mode-line "foo")

;; Set the font
(add-to-list 'default-frame-alist
             '(font . "Envy Code R-10"))

(set-default-font "Envy Code R-10")

;; Turn off tab indentation and use 2 spaces for width
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

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
    ("3f873e7cb090efbdceafb8f54afed391899172dd917bb7a354737a8bb048bd71" "1b4243872807cfad4804d7781c51d051dfcc143b244da56827071a9c2e10ab7f" "8704829d51ea058227662e33f84313d268b330364f6e1f31dc67671712143caf" "db9feb330fd7cb170b01b8c3c6ecdc5179fc321f1a4824da6c53609b033b2810" "b2028956188cf668e27a130c027e7f240c24c705c1517108b98a9645644711d9" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "3a3917dbcc6571ef3942c2bf4c4240f70b5c4bc0b28192be6d3f9acd83607a24" "232f715279fc131ed4facf6a517b84d23dca145fcc0e09c5e0f90eb534e1680f" "aed73c6d0afcf2232bb25ed2d872c7a1c4f1bda6759f84afc24de6a1aec93da8" "b6d649c9f972b491686e7fa634535653e6222c1faca1ab71b3117854470a79ae" "9e87bddff84cbce28c01fa05eb22f986d770628fa202cd5ca0cd7ed53db2f068" "39e93a10eb292941640adfe28509e0c3eeb84e30cbfed6ef9841be136081ca34" "e1551b5516e0a439b6ab019ba00cee866e735f66f22ff67a5d882ad0f1383454" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "cda6cb17953b3780294fa6688b3fe0d3d12c1ef019456333e3d5af01d4d6c054" "6ebb2401451dc6d01cd761eef8fe24812a57793c5ccc427b600893fa1d767b1d" "7545d3bb77926908aadbd525dcb70256558ba05d7c478db6386bfb37fb6c9120" "27890155f81d23512a9933f4ac6110e94de6266e948fd464eda3423c799713e2" "17f35b689dd41e49cb740bfb810ac8a53d13292cbebf68f41f772787d8b3aebf" "c537bf460334a1eca099e05a662699415f3971b438972bed499c5efeb821086b" "e3c90203acbde2cf8016c6ba3f9c5300c97ddc63fcb78d84ca0a144d402eedc6" "7b7ef508f9241c01edaaff3e0d6f03588a6f4fddb1407a995a7a333b29e327b5" "a0fdc9976885513b03b000b57ddde04621d94c3a08f3042d1f6e2dbc336d25c7" "8f1cedf54f137f71382e3367e1843d1n0e173add99abe3a5f7d3285f5cc18f1a9" "2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" "8022cea21aa4daca569aee5c1b875fbb3f3248a5debc6fc8cf5833f2936fbb22" "0ed983facae99849805b2f7be926561cb58474eb18e5296d9bb3ad7f9b088a5b" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" default)))
 '(package-selected-packages
   (quote
    (flatui-theme avy expand-region 0blayout whitespace-cleanup-mode helm-projectile helm yasnippet yaml-mode sed-mode puppet-mode move-text inf-ruby ido-vertical-mode flx-ido dash chruby base16-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
