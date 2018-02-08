#!/bin/bash

# Console colours
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Standard-Editor
export EDITOR=vim

# History size
export HISTSIZE=10000
export HISTFILESIZE=5000
export HISTCONTROL=erasedups
shopt -s histappend

# Completion case insensitive
bind 'set completion-ignore-case on'

export PATH="$PATH:~/.bin"

. ~/profiles/_macos10
