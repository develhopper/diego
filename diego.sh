#!/bin/bash
function resize(){
	if [ -f $1 ];then
		name="$(basename -- $1)"
		echo "resizing ${name}"
		convert $1 -resize $2\> $3/$name
	fi
	return 0;
}
argc=$#

if [ "$#" -lt 3 ];then
		echo "usage: diego.sh [files] [size ex. 1366x768] [output]"
		exit
fi	

size="${@: -2:1}"
output=${!argc}

echo "please wait ..."

for ((i=1; i < $argc-1; i++ )) 
do
		resize ${!i} $size $output
done
