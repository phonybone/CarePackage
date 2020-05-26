;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;;(load-file "~/.emacs.stock")



(package-initialize)
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))

(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")

;; yasnippets
(add-to-list 'load-path
              "~/.emacs.d/elpa/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/elpa/elpy-1.8.0/snippets/python-mode/"
	"~/.emacs.d/plugins/yasnippet-snippets/snippets"
	"~/.emacs.d/mysnippets"
	))
;; was "emacs.d/elpa/yasnippet/snippets"
(yas-global-mode 1)

(load-file "~/.emacs.local.python.el")
(load-file "~/.emacs.local_settings.el")
(load-file "~/.emacs.local.tide.el")
(load-file "~/.emacs.d/macros.el")

(load-file "~/.emacs.d/Direx.el")
(require 'direx)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(direx:ignored-files-regexp
   "\\(?:\\(?:\\.\\(?:aux\\|b\\(?:bl\\|in\\|lg\\|zr/\\)\\|c\\(?:lass\\|ps?\\)\\|d\\(?:\\(?:64fs\\|fs\\|x\\(?:\\(?:32\\|64\\)fs\\)?\\)l\\)\\|elc\\|f\\(?:asl?\\|mt\\|ns?\\|\\(?:x\\(?:\\(?:32\\|64\\)f\\)\\)?sl\\)\\|g\\(?:it/\\|[lm]o\\)\\|hg/\\|idx\\|kys?\\|l\\(?:bin\\|ib\\|o[ft]\\|x\\(?:\\(?:32\\|64\\)fsl\\)\\|[ano]\\)\\|m\\(?:em\\|o\\)\\|p\\(?:64fsl\\|fsl\\|gs?\\|y[co]\\)\\|s\\(?:o\\|parcf\\|vn/\\|x\\(?:\\(?:32\\|64\\)fsl\\)\\)\\|t\\(?:fm\\|oc\\|ps?\\)\\|ufsl\\|vrs?\\|wx\\(?:\\(?:32\\|64\\)fsl\\)\\|x86f\\|[ao]\\)\\|CVS/\\|_\\(?:\\(?:MTN\\|darcs\\)/\\)\\|~\\)\\|#\\)$")
 '(package-selected-packages
   (quote
    (use-package tide realgud magit-gitflow magit markdown-mode yasnippet-classic-snippets elpy edbi))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
