#!/bin/bash

lcd() {
	if [ $# -eq 0 ]
	then
		cd
		ls
	elif [ $# -ge 1 ]
	then
		local destination=${!#}
		local length=$(($#-1))
		local lsargs=${@:1:$length}
		cd $destination
		ls $lsargs
	fi
}
