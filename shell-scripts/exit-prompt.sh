#!/bin/sh
prompt=$(zenity --list --column="0" "exit" "reboot" "poweroff" "lock" "suspend" --hide-header)

case "$prompt" in
	"exit") pkill dwm
		;;
	"reboot") systemctl reboot
		;;
	"poweroff") systemctl poweroff && exit 0
		;;
	"lock") pkill dwm
		;;
	"suspend") systemctl suspend
		;;
	*) exit 1
		;;
esac
