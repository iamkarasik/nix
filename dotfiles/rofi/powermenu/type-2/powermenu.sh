#!/usr/bin/env bash

theme="@theme@"

uptime() {
	uptime_seconds=$(cut -d. -f1 /proc/uptime)
	days=$(( uptime_seconds/86400 ))
	hours=$(( (uptime_seconds%86400)/3600 ))
	minutes=$(( (uptime_seconds%3600)/60 ))

	output="up"
	[[ $days -gt 0 ]] && output+=" $days days,"
	[[ $hours -gt 0 ]] && output+=" $hours hours,"
	[[ $minutes -gt 0 || ( $days -eq 0 && $hours -eq 0 ) ]] && output+=" $minutes minutes"

	echo "${output%,}"
}

up=$(uptime | sed 's/up //g')

shutdown=''
reboot=''
lock=''
suspend=''
logout=''

rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $up" \
		-mesg "Uptime: $up" \
		-theme "$theme"
}

run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

chosen="$(run_rofi)"
case "$chosen" in
	"$shutdown")
		systemctl poweroff
		;;
	"$reboot")
		systemctl reboot
		;;
	"$lock")
		loginctl lock-session
		;;
	"$suspend")
		systemctl suspend
		;;
	"$logout")
		hyprctl dispatch exit
		;;
esac
