# .bashrc: executed for interactive non-login shells

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Aliases and functions go here.
# User specific environment and startup programs go in .bash_profile

files=( ".bash.aliases" ".bash.functions" ".bashrc.local" )
for file in "${files[@]}"; do 
  if [ -f $HOME/$file ]; then
    echo running $file...
    . $HOME/$file
  fi
done


export CDPATH=.:$HOME
set cdpath=$HOME

export PS1="[\h] <\$(current_git_branch)> ($?) \w\$ "

# AWS cmd-line stuff:
if [ -r $HOME/.bash.aws ]; then
  . $HOME/.bash.aws
fi

export EDITOR=`which emacs`

bind 'set match-hidden-files off'
export HISTCONTROL=ignoredups

