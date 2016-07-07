#!/bin/bash     #Explicitly tell shell this is a bash script
set -e          #Exit as soon as any line in the bash script fails

# create file if not exists
# the .aliaser file used to keep commands for using it any time later
if ! [ -e  $HOME'/.aliaser' ] ; then
	echo '# Aliaser - easy aliases keeper developed by Ahmed Ashraf | github.com/ahmedash95 | twitter : @ahmedash95' > $HOME'/.aliaser'	
fi

# if no parameter then exit
if [[ $# -eq 0 ]] ; then
    echo 'please use set or get command'
    echo "set example : aliaser set listHome 'ls ~'"
    echo "get example : aliaser get listHome"
    exit 0
fi

# if command is set then we will set the command into file 
if [ $1 = 'set' ] ; then
	# if user didn't write the alias or the command display error message
	if (( $# < 3 )); then
		echo "please type the alias name followed by the command of the alias"
		exit;
	fi
	# check if the alias name exists or not
	if grep -q $2 "$HOME/.aliaser"; then
		# if alias name is exists then quit with error message
   		echo "The alias $2 is already exists, try to find another name please"
   		exit
 	fi
 	# insert alias to aliaser file
	echo $2"="$3 >> $HOME'/.aliaser'
	echo  $2 'saved successfully'
fi
# get alias command
if [ $1 = 'get' ] ; then
	# if user didn't write the alias then display error message
	if (( $# < 2 )); then
		echo "please type the alias name"
		exit;
	fi
	# check if command is not found
	if ! grep -q $2 "$HOME/.aliaser"; then
		# if alias name is exists then quit with error message
   		echo "The alias $2 is not found"
   		exit
 	fi
 	# get the command with alias from aliaser file
	alaiserCommand=$(grep ^"$2"= $HOME'/.aliaser')
	# replace alias name with equal symbol (=) with null
	alaiserCommand=${alaiserCommand/$2=/""}
	echo "executing : " $alaiserCommand
	# execute the command
	eval ${alaiserCommand/$2=/""}
fi

