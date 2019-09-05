
for file in .emacs* .bash.functions* .bash.aliases*; do 
    if [ -f $file ]; then
	echo $file
	cp $file $HOME
    fi
done
