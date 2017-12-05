#!/bin/bash

eye_health() {
	osascript -e 'display notification "Take a break" with title "Sore eyes?"'
	sleep 60
	osascript -e 'display notification "Break over" with title "Sore eyes?"'
}
