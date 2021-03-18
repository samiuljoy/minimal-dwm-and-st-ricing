#!/bin/sh
if [ $(id -u) = 0 ]; then
	echo "\nSeems like you are root, well, below is a list of packages that will be downloaded"
	echo "\n\t1. Vim(optional)"
	echo "\n\t2. nnn file manager(optional)"
	echo "\n\t3. Build essentials and libxft-dev, libxinerama-dev and libx11-dev for suckless utilities(required)"
	echo "\n\t4. Fira Code font family(required)"
	echo "\n\t5. libnotify-bin for notify-send(optional)"
	echo "\n\t6. pulseaudio(optional)"
	echo "\n\t7. Scrot screenshooter(optional)"
	echo "\n\t8. Zenity for exit prompt(required)"
	echo "\n\t9. lm-sensors for viewing cpu temperature(optional)"
	echo "\n\t10. Compton for transparency and stuffs(optional)"
	echo "\n\t11. feh image viewer(optional)"
	echo "\n\t12. fzf command line fuzzt finder(optional)"
	echo
	echo "\nChose number/s followed by spaces, say if you wish to install vim, nnn, libxft*, pulseaudio, and lm-sensors, but not and fira code, libnotify, scrot and zenity you would have to type in in 1 2 3 s s 6 s s 9 s s. Here "s" stands for skip"
	echo
	read -p "Chose applications to install " vimm nnn libx firaa notify plseaudio scrott zenitty sensors compton fehh fzff
	case "$vimm" in
		"1") which vim > /dev/null
			if [ $? = 0 ]; then
			echo "\nVim seems to be already installed on your system, great!, skipping vim installation"
		else
			echo "Installing vim"
			apt install vim
			if [ $? = 0 ]; then
				echo "\nVim installed correctly"
			else
				echo "\nSomething went wrong while installing vim"
			fi
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
			if [ $? = 0 ]; then
				echo "\nnnn installed correctly"
			else echo "\nSomething went wrong while installing nnn"
			fi
			fi
			;;
		"s") echo "\nSkipping nnn installation"
			;;
		*) echo "Invalid input, skipping nnn setup, continuing rest of the setup though..."
			;;
	esac

	case "$libx" in
		"3") echo "\nInstalling required libraries for suckless utilities"
			apt install -y build-essential libxft-dev libxinerama-dev libx11-dev
			if [ $? = 0 ]; then
				echo "\nRequired libraries for suckless utilities installed correctly"
			else
				echo "\nSome went wrong while installing required dependencies"
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
			if [ $? = 0 ]; then
				echo "\nFira Code font family installed correctly"
			else echo "\nSomething went wrong while installing Firacode font family"
			fi
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
			echo "\nNotify-send seems to be already installed on your system, great!, skipping notify-send installation"
		else
			echo "Installing notify-send file manager"
			apt install libnotify-bin
			if [ $? = 0 ]; then
				echo "\nNotify-send installed correctly"
			else
				echo "\nSomething went wrong while installing notify-send"
			fi
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
			echo "\nPulseaudio seems to be already installed on your system, great!, skipping installation"
		else
			echo "Installing pulseaudio"
			apt install pulseaudio
			if [ $? = 0 ]; then
				echo "\nPulseaudio installed correctly on your system"
			else
				echo "\nSomething went wrong while installing pulseaudio"
			fi
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
			echo "\nScrot seems to be already installed on your system, great!, skipping scrot installation"
		else
			echo "Installing scrot"
			apt install scrot
			if [ $? = 0 ]; then
			       echo "\nScrot installed correctly"
		       else
			       echo "\nSomething went wrong installing scrot on your system"
			fi
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
			echo "\nZenity seems to be already installed on your system, great!, skipping zenity installation"
		else
			echo "Installing Zenity"
			apt install zenity
			if [ $? = 0 ]; then
				echo "\nzenity installed correctly on your system"
			else
				echo "\nSomething went wrong while installing zenity on your system"
			fi
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
			echo "\nlm-sensors seems to be already installed on your system, great!, skipping sensors installation"
		else
			echo "Installing lm-sensors"
			apt install lm-sensors
			if [ $? = 0 ]; then
				echo "\nlm-sensors installed correctly on your system"
			else
				echo "\nSomething went wrong while installing lm-sensors on your system"
			fi
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
			echo "\ncompton seems to be already installed on your system, great!, skipping compton installation"
		else
			echo "Installing compton"
			apt install compton
			if [ $? = 0 ]; then
				echo "\nCompton installed correctly"
			else
				echo "\nSomething went wrong while installing compton on your system"
			fi
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
			echo "\nFeh image viewer seems to be already installed on your system, great!, skipping feh installation"
		else
			echo "Installing feh"
			apt install feh
			if [ $? = 0 ]; then
				echo "\nFeh image viewer installed correctly"
			else
				echo "\nSomething went wrong while installing feh on your system"
			fi
			fi
			;;
		"s") echo "\nSkipping feh installation"
			;;
		*) echo "Invalid input, skipping feh installation..."
			;;
	esac

	case "$fzff" in
		"12") which fzf > /dev/null
			if [ $? = 0 ]; then
			echo "\nFzf seems to be already installed on your system, great!, skipping feh installation"
		else
			echo "Installing fzf"
			apt install fzf
			if [ $? = 0 ]; then
				echo "\nfzf installed correctly"
			else
				echo "\nSomething went wrong while installing fzf on your system"
			fi
			fi
			;;
		"s") echo "\nSkipping fzf installation"
			;;
		*) echo "Invalid input, skipping fzf installation..."
			;;
	esac
else
	echo "\nSeems like you don't have root privilege. You need to have root privilege to install packages. Run the installer as root user"
	exit 1
fi
