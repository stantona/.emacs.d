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


(if (fboundp 'global-linum-mode) (global-linum-mode 1)) ;; display line numbers in the margin
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

(use-package try)

(use-package avy
  :bind ("C-c j" . avy-goto-word-or-subword-1)
  :config (avy-setup-default))

;; Ack replacement
(use-package ag
  :config (when (eq system-type 'darwin) (setq ag-executable "/usr/local/bin/ag")))

(use-package elpy
  :config (elpy-enable))

;; Configure this clusterfuck
(use-package flycheck
  :disabled
  :init (global-flycheck-mode))

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

;; Git on steroids
(use-package magit
  :bind ("C-x g" . magit-status))

(use-package moe-theme
  :if window-system)

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
    (defvar projectile-completion-system)
    (defvar projectile-enable-caching)
    (defvar projectile-indexing-method)
    (setq projectile-mode-line "foo")))

;; Fixes a bug when starting a python REPL
(use-package python
  :config
  (with-eval-after-load 'python
    (defun python-shell-completion-native-try ()
      "Return non-nil if can trigger native completion."
      (let ((python-shell-completion-native-enable t)
            (python-shell-completion-native-output-timeout
             python-shell-completion-native-try-output-timeout))
        (python-shell-completion-native-get-completions
         (get-buffer-process (current-buffer))
         nil "_")))))

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
  (load-theme 'moe-dark t)

  ;; Improve scrolling
  (setq scroll-margin 1
        scroll-step 1
        scroll-conservatively 10000
        scroll-preserve-screen-position 1)

  (when (fboundp 'windmove-default-keybindings) (windmove-default-keybindings))

  (add-to-list 'default-frame-alist '(font . "roboto mono-14"))
  (set-face-attribute 'default t :font "roboto mono-14")

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("b9a06c75084a7744b8a38cb48bc987de10d68f0317697ccbd894b2d0aca06d2b" "8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" default)))
 '(package-selected-packages
   (quote
    (elpy chruby f nginx-mode whitespace-cleanup-mode use-package try puppet-mode projectile monokai-theme moe-theme magit json-mode ido-vertical-mode flycheck flx-ido dracula-theme color-theme-sanityinc-tomorrow base16-theme ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
