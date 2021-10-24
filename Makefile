.PHONY: install
install:
	rsync -u -v --perms -r .bash.functions* .emacs.d/mysnippets bin ${HOME}

.PHONY: update
update:
	rsync -uvpr ${HOME}/.bash.functions* .
	rsync -uvpr ${HOME}/bin .
	rsync -uvpr ${HOME}/.emacs.d/mysnippets .
