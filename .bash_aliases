alias ls='ls -FH'
alias la='ls -FHA'
alias ll='ls -FHl'
alias lsd='ls -FH | grep \/'

##alias rm='/usr/local/scripts/safe_rm \!*'
#unalias rm

##alias=psgrep 'ps auxww | grep \!*'
alias psless='ps -auxww | less'
#alias histgrep='history | grep \!*'
alias l='less -X'
alias so=source

#if [ -z ${DISPLAY} ]; then
#  alias e='nohup emacs -geometry 140x71+616+0 -font 6x13 \!* &'
#else
#  alias e='emacs -nw \!* '
#fi
#alias ec='~/bin/eclipse/eclipse/eclipse >& /dev/null &'

#alias lpr='lpr -Php -p'
alias ftp='ftp -i'
alias du='du -h'

alias bobama='ssh vcassen@bobama'
alias virtus='ssh vcassen@virtus'
alias aegir='ssh vcassen@aegir'
alias cocoa='ssh victor@cocoa.igb.uiuc.edu'
alias cocoa_tunnel='ssh -D 9999 -N victor@cocoa.igb.uiuc.edu'
alias sysbio='ssh vcassen@gate.systemsbiology.net'
# then: firefox->edit->prefrences->advanced->network->settings: manual proxy configuration, SOCKS host, 127.0.0.1, port 9999


alias dict='l /usr/share/dict/words'
#alias xterm='xterm \!* -e tcsh'

alias wwwac='tail -f /usr/local/apache/logs/access_log'
alias weberrors='tail -f /workspace/vcassen/TACO/logs/t1dbase-error_log | /users/vcassen/bin/filter_logs'

#alias kickwww='kill -HUP `cat /var/run/httpd.pid`; tail -f /var/log/httpd/error_log'
alias kick_slimseq='touch /net/dblocal/apps/SLIMarray/rails/cap_slimarray_staging/slimseq_phonybone/tmp/restart.txt'

alias briefStatus='cvs status |& egrep "^\?|Status" | grep -v Up-to-date'
alias cvsupdate='cvs -q update -dP | ~/bin/update_filter.pl'
alias cvsrm='rm \*!; cvs remove \*!'
#alias cvscobranch='cvs -z3 -d:ext:phonybone@cvs.sourceforge.net:/cvsroot/isbiology co -r release_2_5_branch_20060116 \!*'
alias cvsfala='cvs -z3 -d:ext:vcassen@fala.systemsbiology.net:/home/vcassen/cvs_repository'
alias cvsmcs='cvs -z3 -d:ext:motorcy7@motorcyclesoccer.com:/home/motorcy7/cvs_repository'
alias git-night='git status | grep modified | cut -f2 -d: | xargs git commit -m "nightly upload"; git push'

#alias subs='egrep "^sub |__END__" \!*'
#alias defs='egrep "^\s*def " \!*'
#alias perlman='perldoc `findPackage \!*`'
alias dust="find . -name '*~*' -print -exec rm {} \; ; find . -name '.#*' -print -exec rm {} \; ; find . -name 'core.[0-9]*' -exec rm {} \;"
alias dusttest="find . -name '*~*' ; find . -name '.#*' ; find . -name 'core.[0-9]*'"
#alias ds2=     "find . -name '*~*' -exec du -H {}\; ; echo done"
#alias ds2="find . -name '*~*' -exec du -H {} \; -exec rm {} \; ; echo done"

#alias run_last="source ~/bin/run_last \!*"
alias pd=pushd
alias pd1='pushd +1'
alias pd2='pushd +2'
alias dirs='dirs -v'
alias 'cd..'='cd ..'
#alias firefox='~/bin/firefox/firefox >& /dev/null &'
#alias firefox_dev='~/bin/firefox/firefox -P dev &'

alias synergy='~/bin/bin/synergys --config ~/bin/.synergy.conf'
alias qopera='opera >& /dev/null &'
#alias qfirefox='~/bin/firefox/firefox >& /dev/null &'

alias slimsql='mysql -h deimos -u root -p slimseq_staging'
alias kickss='touch ~/slimseq_phonybone/tmp/restart.txt'

alias py=python
alias antrun='ant -Dmain_class=\!:1 run'
alias mongo_start='mongod --fork --dbpath /mnt/price1/vcassen/mongo_dbs/ --logpath /mnt/price1/vcassen/mongo_dbs/logs/mongodb.log --logappend --port 27017; tail -f /mnt/price1/vcassen/mongo_dbs/logs/mongodb.log'
alias mongo_start_dist='mongod --fork --dbpath /mnt/price1/vcassen/mongo_dbs/ --logpath /mnt/price1/vcassen/mongo_dbs/logs/mongodb.log --logappend --replSet geo --port 27017; tail -f /mnt/price1/vcassen/mongo_dbs/logs/mongodb.log'

alias 'aws-micro'="ssh -i ${HOME}/Dropbox/AWS/micro_kp.pem ec2-user@ec2-50-17-110-122.compute-1.amazonaws.com"

