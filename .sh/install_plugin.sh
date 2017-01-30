#!/bin/bash

install_plugin() {
	if [ "$#" -ne 1 ]; then
		echo "Usage: cxo install <PluginName>"
		echo "Creates directory <PluginName> and copies the plugin from the corresponding git-repository"
		return 0
	fi

	local pluginname=$1
	local pluginnamelc=$(echo $1 | awk '{print tolower($0)}')
	# local prefix=${pluginname:0:3}

	git clone git@bitbucket.org:conexco/$pluginnamelc\.git $pluginname
	# if [ "$prefix" = "Swf" ]; then
	# 	git clone git@bitbucket.org:conexco/$pluginnamelc\.git $pluginname
	# elif [ "$prefix" = "Cxo" ]; then
	# 	git clone git@bitbucket.org:conexco/$pluginnamelc\.git $pluginname
	# else
	#	echo "Prefix $prefix unknown"
	# fi
}
