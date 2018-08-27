#!/bin/bash

sshmount() {
	if [ $# -ne 2 ]; then
		echo 'Usage: sshmount [remote directory] [local directory]'
		return
	fi
	
	local remotedir=$1
	local localdir=$2
	local volname=$(uuidgen)

	if [ -e "$localdir" ]; then
		echo "$localdir already exists."
		return
	fi

	mkdir -p $localdir
	sshfs $remotedir $localdir -o defer_permissions -o volname="$volname"
}
