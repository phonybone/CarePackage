#!/bin/tcsh

# ### Source the ISB universal resource file for csh and tcsh
# ### The primary purpose of the universal file is to maintain
# ### standard PATHs for all ARCHitectures and default reasonable
# ### environment variable settings.  You may override these, but
# ### it is not recommended.
#source /net/software/scripts/isb.cshrc

# ### Prepend personal bin directories to standard $PATH
#setenv PATH ${HOME}/bin:${HOME}/bin/${THISARCH}:${HOME}/bin/scripts:$PATH
setenv PATH ${HOME}/bin:${HOME}/bin/scripts:$PATH


# ### Append other directories to standard $PATH
#setenv PATH ${PATH}:/net/cdna/scripts:/net/msg/scripts


# ### Prepend personal man directory to standard $MANPATH
#setenv MANPATH ${HOME}/man:$MANPATH


# ### Standard permission to allow only user write
#umask 022
# ### Standard permission to allow both user and group write privilege
umask 002


# ### Set prompt and related cd (both needed to get prompt to update)
if ($?tcsh) then
  set prompt="%m(%?):%c2%# "
  #alias cd 'set old_dir=$cwd;chdir \!*;set prompt="%m:%c> ";  '
else
  set prompt="`echo $SHORTHOSTNAME`:`echo $cwd` > "
  #alias cd 'set old_dir=$cwd;chdir \!*;set prompt="`echo $SHORTHOSTNAME`:`echo $cwd`> ";  '
endif
alias bk 'set t_dir=$old_dir; cd $t_dir; unset t_dir'


# ### Popular Settings
set noclobber
set history=1000
set rmstar
unset autologout
set filec
set autolist ambiguous
set ellipsis=1

# ### Popular Aliases
alias lo        logout
alias psa       "ps -ef | grep $USER"
alias h         'history \!* | head -39 | more'
alias m         more
#alias ll        'ls -la \!* | more'
alias ff        'find . -name \!* -print'
alias kj        "kill -9"
alias perf      perfmeter
alias ls        ls -F
alias lf        'ls -FC \!* | more'
alias lx        'ls -x | more'
#alias vi        vim
#alias df        df -h
alias xload1    "xload -fg yellow -bg firebrick -hl white -geometry 100x100 &"
alias xclock1   "xclock -analog -fg yellow -bg firebrick -hd yellow -hl yellow -update 1 &"

#alias cp            'cp -i -p'          # ask if about to write over something
#alias mv            'mv -i'             # ask if about to write over something
alias dfl           'df | grep "/dev"'   # show local disk space information
alias setdisp       'setenv DISPLAY'     # shorten redirection
alias setvt100      'setenv TERM vt100'  # Set xterm to VT100 mode
alias cls           'clear'              # clear the terminal screen


# ### Add your own personal aliases and settings
set symlinks=ignore



# Imported from mouse:

#set path = ( . /usr/local/bin /usr/local/scripts ./.bin $path )
#set prompt = "%m/%~%# "

source $HOME/.aliases
set cdpath = ( /home/vcassen /home/vcassen/software /home/vcassen/software/GDxBase )
set histdup=prev

setenv PAGER /usr/bin/less
setenv EDITOR emacs
setenv SHELL /bin/tcsh
setenv LS_OPTIONS '-T -N 0'
setenv CVS_RSH ssh
#setenv PERL5LIB /local/www/test-build/software/GDxBase/lib
setenv PERL5LIB $HOME/software/GDxBase/lib
setenv CONFIG $HOME/software/t1dbase_w_GDxBase/conf/Variables.pm
setenv DBPSWD DL444
setenv SOURCEFORGE_USER phonybone
unset correct
unset autocorrect

