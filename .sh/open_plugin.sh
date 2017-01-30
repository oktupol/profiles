#!/bin/bash

open_plugin () {
	local dev="dev6"
	if [ $# -ge 2 ]
	then
		local plugins=$1
		local plugin=$2
		local lowercase=$(echo $plugin | awk '{print tolower($0)}')

		if [ $# -ge 3 ]
		then
			local dev=$3
		fi

		local path=""
		if [ $# -ge 4 ]
		then
			local path=$4
		fi
		
		open "http://$plugins.conexco-dev.de/$lowercase/$dev/$path"
	else
		echo "Usage: cxo open <server> <PluginName> [environment]"
	fi
}
