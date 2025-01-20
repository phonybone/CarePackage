;; https://www.adventuresinwhy.com/post/eglot/
(require 'tree-sitter)
(require 'tree-sitter-langs)

(defvar major-mode-remap-alist ())
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
