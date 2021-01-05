pidof compton >/dev/null
if [ $? = 0 ]; then
	pkill compton
else
	compton &
fi
