#!/bin/sh
echo "\n\t\t\t\t>>>>>> Welcome! <<<<<<"
echo "\nYou could either download the required packages automatically with this installation which would require you to have root privilege, or you could run the installer as a non-root user."
echo
echo "Run this installer as a non-root or root? Type in 'nonroot' for running as non-root user, or type in 'asroot' to run it as a root user(without the quotes) "
echo
# I could've used positional arguments, but using variables seems fun (:
read -p "[nonroot or asroot]: " rootorno
case "$rootorno" in
	"asroot") echo "\nRunning this installer as a root user"
		sh requirements.sh
		;;
	"nonroot") echo "\nWellp, this installation requires some prerequisite packages to be installed.."
		echo "\nExiting setup..."
		exit 1
		;;
	"*") echo "\nInvalid key pressed, exiting setup..."
		exit 1
		;;
esac

if [ $? = 0 ]; then
	echo "\n\nSettings complete I guess. You can now head over to dwm and st directories and run make and make install on each direcotry to install dwm and st"
	echo "\n\t\t\t\t>>>>>>>> I appreciate you trying out my setup. Hopefully you'll end up liking it ^.^ <<<<<<<<"
else
	echo "\nInstallation halted^~^"
fi
