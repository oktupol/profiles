#!/bin/bash

goto_plugin () {
	local dev="dev6"
	if [ $# -ge 2 ]
	then
		if [ $1 == "plugins" -o $1 == "plugins5" -o $1 == "43" -o $1 == "50" -o $1 == "51" -o $1 == "52" ]
		then
			local plugins=$1
			local plugin=$2
			if [ $# -ge 3 ]
			then
				local dev=$3
			fi

			local directory=$(df /Volumes/* | grep \\/$plugins\\. | grep -o [a-zA-Z0-9_-]*$)
			local lowercase=$(echo $plugin | awk '{print tolower($0)}')
			cd /Volumes/$directory/$lowercase/$dev/engine/Shopware/Plugins/Community/Frontend/$plugin 2> /dev/null \
				|| cd /Volumes/$directory/$lowercase/$dev/engine/Shopware/Plugins/Community/Backend/$plugin 2> /dev/null \
				|| echo "Plugin or environment not found"
		elif [ $1 == "shop" ]
		then
			local action=$2
			if [ $action == "root" ]
			then
				local shopwarephp=$(ls | grep -o shopware\.php)
				local workingdir=$(pwd)
				while [ "$workingdir" != "/" -a "$shopwarephp" != "shopware.php" ]
				do
					cd ..
					local shopwarephp=$(ls | grep -o shopware\.php)
					local workingdir=$(pwd)
				done
			elif [ $action == "plugins" ]
			then
				cxo goto shop root
				cd engine/Shopware/Plugins/Community
			else
				local directory=$(df /Volumes/* | grep \\/$action\\. | grep -o [a-zA-Z0-9_-]*$)
				if [ $# -ge 3 ]
				then
					local dev=$3
				fi
				cd /Volumes/$directory/$dev/ \
					|| echo "Shop or dev not found"
			fi
		else
			local project=$1
			local plugin=$2
			if [ $# -ge 3 ]
			then
				local dev=$3
			fi

			local directory=$(df /Volumes/* | grep $project\\. | grep -o [a-zA-Z0-9_-]*$)
			cd /Volumes/$directory/$dev/engine/Shopware/Plugins/Community/Frontend/$plugin 2> /dev/null \
				|| cd /Volumes/$directory/$dev/engine/Shopware/Plugins/Community/Backend/$plugin 2> /dev/null \
				|| echo "Plugin or environment not found"
		fi
	else
		echo "Usage: cxo goto <server> <PluginName> [dev]"
	fi
}
