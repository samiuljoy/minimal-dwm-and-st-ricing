#!/usr/bin/env sh

# Error check
error_check() {
    case "$?" in
        0 ) echo "Successful installation"
            ;;
        * ) echo "Something went wrong while installing $package_name"
            return 1
            ;;
    esac
}

# default function;
default_install() {
    which $package_query > /dev/null
    case "$?" in
        0 ) echo "$package_name seems to be already installed, skipping $package_name installation"
            ;;
        * ) echo "Installing $package_name"
            apt install -yy $package_name
            # Calling error check function
            error_check
            ;;
    esac
}

# skip installation
skip_install() {
    echo "skipping $package_name installation"
}

# invalid input message
invalid_input() {
    echo "Invalid input, continuing rest of the setup"
}

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
        "1") # Setting package name variable
            package_query="vim"
            package_name="vim"
            # calling default function
            default
            ;;
        "s") package_name="vim"
            # calling skip function
            skip
            ;;
        *) # calling invalid input function
            invalid_input
            ;;
    esac

    case "$nnn" in
        "2") package_query="nnn"
            package_name="nnn"
            default
            ;;
        "s") package_name="nnn"
            skip
            ;;
        *) invalid_input
            ;;
    esac

    case "$libx" in
        "3") package_name="build-essential libxft-dev libxinerama-dev libx11-dev"
            default_install
            ;;
        "s") skip_install
            ;;
        *) invalid_input
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
        "5") package_query="notify-send"
            package_name="libnotify-bin"
            ;;
        "s") skip_install
            ;;
        *) invalid_input
            ;;
    esac

    case "$plseaudio" in
        "6") package_query="pulseaudio"
            package_name="pulseaudio"
            default
            ;;
        "s") package_name="pulseaudio" 
            skip_install
            ;;
        *) invalid_input
            ;;
    esac

    case "$scrott" in
        "7") package_query="scrot"
            package_name="scrot"
            default
            ;;
        "s") package_name="scrot" 
            skip_install
            ;;
        *) invalid_input
            ;;
    esac

    case "$zenitty" in
        "8") package_query="zenitty"
            package_name="zenity"
            default
            ;;
        "s") package_name="zenity"
            skip_install
            ;;
        *) invalid_input
            ;;
    esac


    case "$sensors" in
        "9") package_query="sensors"
            package_name="lm-sensors"
            default
            ;;
        "s") skip_install
            ;;
        *) invalid_input
            ;;
    esac

    case "$compton" in
        "10") package_query="compton"
            package_name="compton"
            default
            ;;
        "s") package_name="compton"
            skip_install
            ;;
        *) invalid_input
            ;;
    esac

    case "$fehh" in
        "11") package_query="feh"
            package_name="feh"
            default
            ;;
        "s") package_name="feh"
            skip_install
            ;;
        *) invalid_input
            ;;
    esac

    case "$fzff" in
        "12") package_query="fzf"
            package_name="fzf"
            default
            ;;
        "s") package_name="fzf"
            skip_install
            ;;
        *) invalid_input
            ;;
    esac
else
    echo "\nSeems like you don't have root privilege. You need to have root privilege to install packages. Run the installer as root user"
    exit 1
fi
