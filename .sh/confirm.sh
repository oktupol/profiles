#!/bin/bash

confirm () {
	read -r -p "${1:-Are you sure? [y/N]} " response
	case $response in
		[yY][eE][sS]|[yY])
			true
			;;
		*)
			false
			;;
	esac
}
