;; string-inflection:
(add-to-list 'load-path "~/.emacs.d/string-inflection")
(require 'string-inflection)

(add-hook 'python-mode-hook
          #'(lambda ()
             (local-set-key (kbd "C-c C-u") 'string-inflection-python-style-cycle)))
