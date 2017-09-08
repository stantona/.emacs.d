;; Turn off mouse interface early in startup to avoid momentary display

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;;

(package-initialize)
(prefer-coding-system 'utf-8-unix)

;; Set alternative location for backup files
(setq backup-directory-alist
  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))

(setq column-number-mode t)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;; Remove flash screen for heavens sake...
(setq inhibit-startup-message t)

(require 'init-packages)

;; Install packages (if they aren't already installed)
(packages-install
 '(ag
   inf-ruby
   chruby
   fill-column-indicator
   flx-ido
   ido-vertical-mode
   yaml-mode
   json-mode
   projectile
   puppet-mode
   whitespace-cleanup-mode
   zoom-frm))

;; Code for GUI emacs only
(when (display-graphic-p)
  (packages-install '(base16-theme))

  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

  ;; Improve scrolling
  (setq scroll-margin 1
        scroll-step 1
        scroll-conservatively 10000
        scroll-preserve-screen-position 1)

  ;; If working on a mac, use the 'command' key as the meta key
  (when (eq system-type 'darwin)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier nil)
    (setq ag-exectuable "/usr/local/bin/ag"))

  (when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))

  ;; Setup themes and fonts
  (load-theme 'base16-tomorrow t t)
  (enable-theme 'base16-tomorrow)

  (add-to-list 'default-frame-alist '(font . "monaco-12"))
  (set-face-attribute 'default t :font "monaco-12")

  ;; Show the file name and path in the frame's title
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b"))))

  (setq fci-rule-column 120)
  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1))

(projectile-global-mode)
(defvar projectile-completion-system)
(defvar projectile-enable-caching)
(defvar projectile-indexing-method)

;; Initialize ido mode
(require 'init-ido)

;; Initialize json mode
(require 'init-json)

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

(global-whitespace-cleanup-mode)
(setq whitespace-style '(tabs face trailing))
(global-whitespace-mode 1)


(setq json-reformat:indent-width 2)

;; display line numbers in the margin
(global-linum-mode 1)

;; This fixes a bug with projectile
;; https://github.com/bbatsov/projectile/issues/657
(setq projectile-mode-line "foo")

;; Turn off tab indentation and use 2 spaces for width
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; Use ibuffer
(defalias 'list-buffers 'ibuffer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "5eb4b22e97ddb2db9ecce7d983fa45eb8367447f151c7e1b033af27820f43760" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "3f873e7cb090efbdceafb8f54afed391899172dd917bb7a354737a8bb048bd71" "1b4243872807cfad4804d7781c51d051dfcc143b244da56827071a9c2e10ab7f" "8704829d51ea058227662e33f84313d268b330364f6e1f31dc67671712143caf" "db9feb330fd7cb170b01b8c3c6ecdc5179fc321f1a4824da6c53609b033b2810" "b2028956188cf668e27a130c027e7f240c24c705c1517108b98a9645644711d9" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "3a3917dbcc6571ef3942c2bf4c4240f70b5c4bc0b28192be6d3f9acd83607a24" "232f715279fc131ed4facf6a517b84d23dca145fcc0e09c5e0f90eb534e1680f" "aed73c6d0afcf2232bb25ed2d872c7a1c4f1bda6759f84afc24de6a1aec93da8" "b6d649c9f972b491686e7fa634535653e6222c1faca1ab71b3117854470a79ae" "9e87bddff84cbce28c01fa05eb22f986d770628fa202cd5ca0cd7ed53db2f068" "39e93a10eb292941640adfe28509e0c3eeb84e30cbfed6ef9841be136081ca34" "e1551b5516e0a439b6ab019ba00cee866e735f66f22ff67a5d882ad0f1383454" "50e7f9d112e821e42bd2b8410d50de966c35c7434dec12ddea99cb05dd368dd8" "cda6cb17953b3780294fa6688b3fe0d3d12c1ef019456333e3d5af01d4d6c054" "6ebb2401451dc6d01cd761eef8fe24812a57793c5ccc427b600893fa1d767b1d" "7545d3bb77926908aadbd525dcb70256558ba05d7c478db6386bfb37fb6c9120" "27890155f81d23512a9933f4ac6110e94de6266e948fd464eda3423c799713e2" "17f35b689dd41e49cb740bfb810ac8a53d13292cbebf68f41f772787d8b3aebf" "c537bf460334a1eca099e05a662699415f3971b438972bed499c5efeb821086b" "e3c90203acbde2cf8016c6ba3f9c5300c97ddc63fcb78d84ca0a144d402eedc6" "7b7ef508f9241c01edaaff3e0d6f03588a6f4fddb1407a995a7a333b29e327b5" "a0fdc9976885513b03b000b57ddde04621d94c3a08f3042d1f6e2dbc336d25c7" "8f1cedf54f137f71382e3367e1843d1n0e173add99abe3a5f7d3285f5cc18f1a9" "2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" "8022cea21aa4daca569aee5c1b875fbb3f3248a5debc6fc8cf5833f2936fbb22" "0ed983facae99849805b2f7be926561cb58474eb18e5296d9bb3ad7f9b088a5b" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" default)))
 '(package-selected-packages
   (quote
    (ag zoom-frm yaml-mode whitespace-cleanup-mode puppet-mode projectile popup json-mode inf-ruby ido-vertical-mode helm-core flx-ido fill-column-indicator color-theme-modern chruby base16-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
