;; perl stuff

(fset 'remove-got-heres
   "\C-swarn \"got here\C-a\C-k\C-k")
(global-set-key "\C-x!"    'remove-got-heres) ;


(fset 'perl-moose-insert-has
   [?h ?a ?s ?  ?\' ?\' ?  ?= ?> ?\S-  ?\( ?i ?s ?= ?> ?\' ?r ?w ?\' ?, ?  ?i ?s ?a ?= ?> ?\' ?S ?t ?r ?\' ?\) ?\; ?\C-a right right right right right])
(add-hook 'perl-mode-hook '(lambda() (local-set-key "\C-ch" 'perl-moose-insert-has)))

