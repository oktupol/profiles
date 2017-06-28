#!/bin/bash

delete_old_tmp_files() {
		local currdir="$(pwd)"

		cd ~/.Trash
		find . -type f -mtime +1 -delete
		find . -mindepth 1 -type d -empty -delete

		cd ~/tmp
		find . -type f -mtime +7 -delete
		find . -mindepth 1 -type d -empty -delete

		cd ~/Downloads
		find . -type f -mtime +30 -delete
		find . -mindepth 1 -type d -empty -delete

		cd $currdir

		osascript -e 'display notification "Deleted old tmp files" with title "Tmp Garbage Collector"'
}
