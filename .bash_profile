#!/bin/bash

# Konsole Text vor Kommando
PROMPT_COMMAND=__prompt_command

__prompt_command() {
	local exitStatus=$?

	PS1=''

	local RCol='\[\e[0m\]'

	local nRed='\[\e[0;31m\]'
	local lPurple='\[\e[1;95m\]'
	local lBlue='\[\e[1;34m\]'
	local dBlue='\[\e[0;34m\]'
	local dGray='\[\e[0;90m\]'
	local lGreen='\[\e[1;32m\]'
	local dGreen='\[\e[2;32m\]'

	# Date and time
	PS1+="${lPurple}\D{%Y-%m-%d %T}${RCol} "
	
	# User and directory
	PS1+="\u:\w "

	# History number
	PS1+="!\!"

	# Exit code
	if [ $exitStatus -ne 0 ]; then
			PS1+=" ${nRed}${exitStatus}${RCol}"
	fi

	# Git branch
	PS1+="${lBlue}$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')${RCol}"

	PS1+="${dGray}$(git --no-pager log --oneline -n1 2> /dev/null | sed -e 's/\(.*\)/ [\1]/')${RCol}"

	# Colon and new line
	PS1+=":\n"
	
	# Dollar
	PS1+="${dGreen}\$${RCol}"

	PS1+=" $(tput sgr0)"
}

export PS2='\e[32m\e[2m>\e[22m\e[39m '

# History size
export HISTSIZE=10000
export HISTFILESIZE=1000

# Completion case insensitive
bind 'set completion-ignore-case on'


# Aliase
alias cd..='cd ..'

alias top='htop'

alias :e='vim'
alias :q='exit'
