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

# Farben in der Konsole
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Standard-Editor
export EDITOR=vim

# History size
export HISTSIZE=10000
export HISTFILESIZE=1000

# Completion case insensitive
bind 'set completion-ignore-case on'

# Less syntax highlighting
# first, execute 'brew install source-highlight'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export LESS=' -R '

# Alle Skripte im .sh Ordner einbinden
if [ -d ~/.sh ]
then
	for script in ~/.sh/*.sh
	do
		if [ -f $script ]
		then
			. $script
		fi
	done
else
	echo "Put your custom functions in ~/.sh/<function_name>.sh"
fi


# Aliase
alias cd..='cd ..'

alias exit='confirm && exit'

alias gvim='open -a MacVim'

alias l='ls'
alias la='ls -a'
alias lah='ls -lah | more'
alias lh='ls -lh | more'
alias lha='ls -lah | more'
alias ll='ls -l'
alias lla='ls -la'
alias lm='ls -l | more'

alias lsc='lcd'
alias cls='cdl'

alias launch='open'

alias mvim='open -a MacVim'

alias phpstorm='open -a PhpStorm'

alias top='htop'

alias :e='vim'
alias :q='exit'
