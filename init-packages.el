(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

(defun packages-install (packages)
  (mapc 'package-get packages)
  (delete-other-windows))

(defun package-get (package)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'init-packages)
