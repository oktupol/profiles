#!/bin/bash

# Terminal-based russian roulette
# Include this file in your .bashrc with ". roulette.sh"
#
# Examples:
# sudo roulette rm -rf /
# sudo roulette mail -s "Go fuck yourself" boss@company.org <<< ""
roulette() {
	if [ $(($RANDOM % 6)) -eq 1 ]; then
		$@
	else
		echo 'click...'
	fi
}
