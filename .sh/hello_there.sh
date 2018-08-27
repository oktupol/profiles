#!/bin/bash

hello() {
	if [ $# -ne 1 ] || [ $1 != 'there' ]; then
		echo '-bash: hello: command not found'
		return 127
	else
		echo 'General Kenobi!'
	fi
}
