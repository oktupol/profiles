#!/bin/bash

cdl() {
	if [ $# -eq 0 ]
	then
		cd
		ls
	elif [ $# -ge 1 ]
	then
		local destination=$1
		shift
		cd $destination
		ls $@
	fi
}
