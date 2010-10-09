#!/bin/tcsh

# ### Source the ISB universal resource file for csh and tcsh
# ### The primary purpose of the universal file is to maintain
# ### standard PATHs for all ARCHitectures and default reasonable
# ### environment variable settings.  You may override these, but
# ### it is not recommended.
#source /net/software/scripts/isb.cshrc

# ### Prepend personal bin directories to standard $PATH
setenv PATH "${HOME}/bin:/tools/bin:/local/bin:${PATH}"
if ( $?LD_LIBRARY_PATH ) then
  setenv LD_LIBRARY_PATH "${LD_LIBRARY_PATH}:/local/lib"
else
  setenv LD_LIBRARY_PATH "/local/lib"
endif

# ### Make some ARCHitecture dependant settings:
if ( -x /bin/arch ) setenv THISARCH `/bin/arch`
if ( $?THISARCH ) then
  setenv THISARCH Unknown
endif




# ### Prepend personal man directory to standard $MANPATH
if ( $?MANPATH ) then
  setenv MANPATH ${HOME}/man:$MANPATH
endif

# ### Standard permission to allow only user write
#umask 022
# ### Standard permission to allow both user and group write privilege
umask 002



# ### Set prompt and related cd (both needed to get prompt to update)
if ($?tcsh) then
  set promptchars='>#'
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


source $HOME/.aliases
set cdpath = ( /workspace/vcassen /workspace/vcassen/TACO/software /workspace/vcassen/GDxBase )
set histdup=prev

setenv PAGER /usr/bin/less
setenv EDITOR emacs
setenv SHELL /bin/tcsh
setenv LS_OPTIONS '-T -N 0'
setenv CVS_RSH ssh
setenv PERL5LIB /users/vcassen/sandbox/perl/lib:/workspace/vcassen/TACO/software/GDxBase/lib:/jdrf_tools/lib/perl5/site_perl/5.8.5/
setenv DBPSWD DL444
setenv CONFIG /workspace/vcassen/TACO/software/t1dbase_w_GDxBase/conf/Variables.pm
setenv JAVA_HOME /local/software/jdk
setenv JCR_HOME /local/software/jcr
setenv JRE_HOME /local/software/jdk
setenv CATALINA_HOME /local/software/tomcat
unset correct
unset autocorrect



setenv RNA-SEQ_HOME "/users/vcassen/software/Solexa/RNA-Seq"


setenv RNA_SEQ_HOME $HOME/software/Solexa/RNA-Seq
set RNA_SEQ_HOME=$HOME/software/Solexa/RNA-Seq

# Set $ENV vars for RNA-Seq:
setenv PYTHONPATH "$RNA_SEQ_HOME"
setenv CISTEMATIC_ROOT $HOME/software/Solexa/genomes/mouse
setenv ERANGEPATH $RNA_SEQ_HOME/commoncode
setenv CISTEMATIC_TEMP $RNA_SEQ_HOME/tmp


# Set RUBYLIB for bento's benefit: or something...
#setenv RUBYLIB /users/vcassen/proj_vcassen/rna-seq/rna-seq-scripts/lib
# Old bento settings:
#    setenv RUBYLIB /local/lib:/local/lib/ruby
#    setenv GEM_HOME /local/lib

set hn=`hostname | cut -f1 -d\.`
switch ($hn)
    case bento:			# now the same as default
    setenv RUBYLIB /tools/lib/ruby:/tools/lib/ruby/site_ruby/1.8
    setenv GEM_HOME /tools/lib/ruby/gems/1.8
    breaksw
    case slim:
    setenv RUBYLIB /local/usr/lib/ruby/site_ruby/1.8/
    setenv GEM_HOME /local/usr/lib/ruby/gems/1.8
    default:
    setenv RUBYLIB /tools/lib/ruby
    setenv GEM_HOME /tools/lib/ruby/gems/1.8
    breaksw
endsw


# SGE
if ( -f /sge/aegir/common/settings.csh ) then
   source /sge/aegir/common/settings.csh
endif

