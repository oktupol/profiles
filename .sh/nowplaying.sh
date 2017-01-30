#!/bin/bash

nowplaying() {
	local egofmpage="`wget -qO- 'http://www.egofm.de/musik/play-history'`"
	[[ $egofmpage =~ '<div class="artist">'([a-zA-Z. 0-9&;-]*) ]] && echo "Artist:" ${BASH_REMATCH[1]}
	[[ $egofmpage =~ '<div class="name">&nbsp;'([a-zA-Z. 0-9&;-]*) ]] && echo "Name:" ${BASH_REMATCH[1]}
}
