# .bashrc: executed for interactive non-login shells

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Aliases and functions go here.
# User specific environment and startup programs go in .bash_profile

if [ -f $HOME/.bash.aliases ]; then
  . $HOME/.bash.aliases
fi

if [ -f $HOME/.bash.functions ]; then
  . $HOME/.bash.functions
fi

if [ -f $HOME/.bashrc.local ]; then
  . $HOME/.bashrc.local
fi



export PS1="[\h] <\$(current_git_branch)> ($?) \w\$ "

# AWS cmd-line stuff:
if [ -r $HOME/.bash.aws ]; then
  . $HOME/.bash.aws
fi

export EDITOR=/usr/bin/emacs

bind 'set match-hidden-files off'

