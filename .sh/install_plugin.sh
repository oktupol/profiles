#!/bin/bash

install_plugin() {
	if [ "$#" -ne 1 ]; then
		echo "Usage: cxo install <PluginName>"
		echo "Creates directory <PluginName> and copies the plugin from the corresponding git-repository"
		return 0
	fi

	local pluginname=$1
	local pluginnamelc=$(echo $1 | awk '{print tolower($0)}')

	git clone --depth=1 git@bitbucket.org:conexco/$pluginnamelc\.git $pluginname
}
