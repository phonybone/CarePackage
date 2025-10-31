;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;;(load-file "~/.emacs.stock")


(package-initialize)
(require 'package)
(setq package-archives '(
			 ("gnu" . "http://elpa.gnu.org/packages/")
;;                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")

(server-start)
(setq server-socket-dir "~/.emacs.d/server")

(load-file "~/.emacs.d/setup/local.settings.el")
(load-file "~/.emacs.d/setup/local.flycheck.el")
(load-file "~/.emacs.d/setup/local.python.el")

(load-file "~/.emacs.d/setup/local.eglot.el")
;; (load-file "~/.emacs.d/setup/local.eglot.adv-in-why.el")
;; (load-file "~/.emacs.d/setup/python-setup-init.el")
;; (load-file "~/.emacs.d/setup/local.tide.el")
(load-file "~/.emacs.d/setup/local.yasnippets.el")
(load-file "~/.emacs.d/setup/local.orgmode.el")
;; (load-file "~/.emacs.d/setup/local.projectile.el")
;; (load-file "~/.emacs.d/setup/local.treesitter.el")

;; Auto-generated stuff follows:

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company eglot eldoc exec-path-from-shell flycheck lsp-mode
	     lsp-pyright tree-sitter tree-sitter-langs treesit-auto
	     typescript-mode yasnippet)))
