#!/bin/sh
if [ $(id -u) = 0 ]; then
	echo "\nSeems like you are root, well, below is a list of packages that will be downloaded"
	echo "\n\t1. Vim(optional)"
	echo "\n\t2. nnn file manager(optional)"
	echo "\n\t3. Build essentials and libxft-dev, libxinerama-dev and libx11-dev for suckless utilities(required)"
	echo "\n\t4. Font Fira Code(required)"
	echo "\n\t5. libnotify-bin for notify-send(optional)"
	echo "\n\t6. pulseaudio(optional)"
	echo "\n\t7. Scrot screenshoter(optional)"
	echo "\n\t8. Zenity for exit prompt(required)"
	echo "\n\t9. lm-sensors for viewing cpu termperature(optional)"
	echo "\n\t10. Compton for transparency and stuffs(optional)"
	echo "\n\t11. feh image viewer(optional)"
	echo
	echo "\nChose number/s followed by spaces, say if you wish to install vim, nnn, libxft*, pulseaudio, and lm-sensors, but not and fira code, libnotify, scrot and zenity you would have to type in in 1 2 3 s s 6 s s 9 s s. Here "s" stands for skip"
	echo
	read -p "Chose applications to install " vimm nnn libx firaa notify plseaudio scrott zenitty sensors compton fehh
	case "$vimm" in
		"1") which vim > /dev/null
			if [ $? = 0 ]; then
			echo "\nVim seems to be already installed on your system, great!, skipping vim installation"
		else
			echo "Installing vim"
			apt install vim
		fi
			;;
		"s") echo "\nSkipping vim installation"
			;;
		*) echo "Invalid input, skipping vim installation continuing rest of the setup though..."
			;;
	esac

	case "$nnn" in
		"2") which nnn > /dev/null
			if [ $? = 0 ]; then
			echo "\nnn file manager seems to be already installed on your system, great!, skipping nnn installation"
		else
			echo "Installing nnn file manager"
			apt install nnn
		fi
			;;
		"s") echo "\nSkipping nnn installation"
			;;
		*) echo "Invalid input, skipping nnn setup, continuing rest of the setup though..."
			;;
	esac

	case "$libx" in
		"3") echo "\nInstalling required libraries for suckless utilities"
			apt install build-essential libxft-dev libxinerama-dev libx11-dev -yy
		fi
			;;
		"s") echo "\nSkipping custom libraries installation"
			;;
		*) echo "Invalid input, skipping dwm libraries setup, continuing rest of the setup though..."
			;;
	esac
	
	case "$firaa" in
		"4") if [ $(ls /usr/share/font* | grep -i fira | sed 's/://g' ) = "/usr/share/fonts-firacode" ]; then
			echo "\nFira Code font family seems to be already installed on your system, great!, skipping font installation"
		else
			echo "Installing Fira Code font family"
			apt install fonts-firacode
		fi
			;;
		"s") echo "\nSkipping fonts-firacode installation"
			;;
		*) echo "Invalid input, skipping fonts-firacode setup, continuing rest of the setup though..."
			;;
	esac

	case "$notify" in
		"5") which notify-send > /dev/null
			if [ $? = 0 ]; then
			echo "\notify-send seems to be already installed on your system, great!, skipping notify-send installation"
		else
			echo "Installing notify-send file manager"
			apt install libnotify-bin
		fi
			;;
		"s") echo "\nSkipping notify-send installation"
			;;
		*) echo "Invalid input, skipping notify-send setup, continuing rest of the setup though..."
			;;
	esac

	case "$plseaudio" in
		"6") which pulseaudio > /dev/null
			if [ $? = 0 ]; then
			echo "\Pulseaudio seems to be already installed on your system, great!, skipping installation"
		else
			echo "Installing pulseaudio"
			apt install pulseaudio
		fi
			;;
		"s") echo "\nSkipping pulseaudio installation"
			;;
		*) echo "Invalid input, skipping pulseaudio setup, continuing rest of the setup though..."
			;;
	esac

	case "$scrott" in
		"7") which scrot > /dev/null
			if [ $? = 0 ]; then
			echo "\Scrot seems to be already installed on your system, great!, skipping scrot installation"
		else
			echo "Installing scrot"
			apt install scrot
		fi
			;;
		"s") echo "\nSkipping scrot installation"
			;;
		*) echo "Invalid input, skipping scrot setup, continuing rest of the setup though..."
			;;
	esac

	case "$zenitty" in
		"8") which zenity > /dev/null
			if [ $? = 0 ]; then
			echo "\Zenity seems to be already installed on your system, great!, skipping zenity installation"
		else
			echo "Installing Zenity"
			apt install zenity
		fi
			;;
		"s") echo "\nSkipping zenity installation"
			;;
		*) echo "Invalid input, skipping zenity installation..."
			;;
	esac


	case "$sensors" in
		"9") which sensors > /dev/null
			if [ $? = 0 ]; then
			echo "\Zlm-sensors seems to be already installed on your system, great!, skipping sensors installation"
		else
			echo "Installing lm-sensors"
			apt install lm-sensors
		fi
			;;
		"s") echo "\nSkipping lm-sensors installation"
			;;
		*) echo "Invalid input, skipping sensors installation..."
			;;
	esac

	case "$compton" in
		"10") which compton > /dev/null
			if [ $? = 0 ]; then
			echo "\Zcompton seems to be already installed on your system, great!, skipping compton installation"
		else
			echo "Installing compton"
			apt install compton
		fi
			;;
		"s") echo "\nSkipping compton installation"
			;;
		*) echo "Invalid input, skipping compton installation..."
			;;
	esac

	case "$fehh" in
		"11") which feh > /dev/null
			if [ $? = 0 ]; then
			echo "\ZFeh image viewer seems to be already installed on your system, great!, skipping feh installation"
		else
			echo "Installing feh"
			apt install feh
		fi
			;;
		"s") echo "\nSkipping feh installation"
			;;
		*) echo "Invalid input, skipping feh installation..."
			;;
	esac

else
	echo "\nSeems like you dont have root privilege. You need to have root privilege to install packages"
fi
