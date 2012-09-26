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



#PATH=$PATH:$HOME/bin
PATH=/usr/lib64/qt-3.3/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/home/ISB/vcassen/bin
export PATH

export CDPATH=.:$HOME
set cdpath=$HOME


export PS1="\$(current_git_branch) ($?) \w\$ "


export TRENDS_HOME="/mnt/price1/vcassen/trends"
export AUREA_HOME="/mnt/price1/vcassen/AUREA"
export AUREA_SRC="${AUREA_HOME}/src/AUREA"

export AWS_SWF_SAMPLES_CONFIG=/home/ISB/vcassen/sandbox/java/aws/aws-java-sdk-1.3.18/samples/AwsFlowFramework

# AWS cmd-line stuff:
if [ -r $HOME/.bash.aws ]; then
  . $HOME/.bash.aws
fi

export EDITOR=/usr/bin/emacs

bind 'set match-hidden-files off'

