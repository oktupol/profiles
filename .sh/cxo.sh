#!/bin/bash

cxo () {
	if [ $# -eq 0 ]
	then
		echo "Available commands:"
		echo "cxo install"
		echo "cxo update"
		echo "cxo goto"
		echo "cxo open"
		return 0
	fi
	if [ $1 == "install" ]
	then
		shift
		install_plugin $@
	elif [ $1 == "update" ]
	then
		shift
		update_plugin $@
	elif [ $1 == "goto" ]
	then
		shift
		goto_plugin $@
	elif [ $1 == "open" ]
	then
		shift
		open_plugin $@
	fi
}
