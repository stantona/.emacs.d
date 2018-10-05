;;; Commentary:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq column-number-mode t)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq sh-basic-offset 2)
(setq sh-indentation 2)
(setq tab-width 2)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(prefer-coding-system 'utf-8-unix)

;; Setup the package manager
(package-initialize)
(require 'package)
(setq package-enable-at-startup nil)
(setq use-package-always-ensure t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package flx-ido
  :config
  (progn
    (ido-mode t)
    (ido-everywhere t)
    (flx-ido-mode t)
    (setq ido-enable-flex-matching t)))

(use-package json-mode
  :config
  (setq json-reformat:indent_width 2)
  (add-hook 'json-mode-hook
            (lambda ()
              (make-local-variable 'js-indent-level)
              (setq js-indent-level 2))))

;; Vertical mode for file selection
(use-package ido-vertical-mode
  :config
  (progn
    (ido-vertical-mode)
    (setq ido-vertical-define-keys t)))

;; Project management system
(use-package projectile
  :config
  (progn
    (projectile-global-mode)
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    (defvar projectile-completion-system)
    (defvar projectile-enable-caching)
    (defvar projectile-indexing-method)
    (setq projectile-mode-line "foo")))

(use-package puppet-mode)

;; Ruby mode
(use-package ruby-mode
  :mode (("Gemfile\\'" . ruby-mode)
         ("\\.rake\\'" . ruby-mode)
         ("\\.erb\\'" . ruby-mode)
         ("\\.pryrc\\'" . ruby-mode)
         ("\\.irbrc\\'" . ruby-mode)))

(use-package whitespace-cleanup-mode
  :config
  (progn
    (global-whitespace-cleanup-mode)
    (setq whitespace-style '(tabs face trailing))
    (global-whitespace-mode 1)))

(when (eq system-type 'darwin)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier nil)
    (setq ns-right-option-modifier 'super))

;; Code for GUI emacs only
(when (display-graphic-p)
  ;; Improve scrolling
  (setq scroll-margin 1
        scroll-step 1
        scroll-conservatively 10000
        scroll-preserve-screen-position 1)

  (when (fboundp 'windmove-default-keybindings) (windmove-default-keybindings))

  (add-to-list 'default-frame-alist '(font . "SF Mono-14"))
  (set-face-attribute 'default t :font "SF Mono-14")

  ;; Show the file name and path in the frame's title
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b")))))

;; This fixes a bug with projectile
;; https://github.com/bbatsov/projectile/issues/657
;; (setq projectile-mode-line "foo")       ;

;; Turn off tab indentation and use 2 spaces for width

;; Use ibuffer
(defalias 'list-buffers 'ibuffer)
