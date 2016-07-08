#!/bin/bash
# Konsole Text vor Kommando
export PS1='\e[1m\e[95m\D{%Y-%m-%d %T}\e[39m \u:\w !\!:\n\e[32m\e[2m\\$\e[22m\e[39m \[$(tput sgr0)\]\e[0m'
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
