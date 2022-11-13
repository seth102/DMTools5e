#!/bin/bash

# Name
if [[ -f Name.txt ]]; then
    if [[ "$(cat Name.txt)" == "true" ]]; then
        echo
    else
        echo "true" > Name.txt
        nohup kitty -T "DM Tools 5e" sh -c "./DM\ Tools\ 5e.sh" & > /dev/null 2&>1
        exit
    fi
else
    echo "true" > Name.txt
    nohup kitty -T "DM Tools 5e" sh -c "./DM\ Tools\ 5e.sh" & > /dev/null 2&>1
    exit
fi

# Functions
. Functions.sh

mainmenu() {
clear
echo "Welcome to Alexia's DM Tools for 5e in bash."
TQuit
echo "Please choose an option from below."
select tempsel in "Magic Item Price Generator"; do
    case $tempsel in
        Magic\ Item\ Price\ Generator)
            mipg
            mainmenu
            ;;
        *)
            wildcard exit mainmenu
            ;;
    esac
done
}
exit() {
rm Name.txt
command exit
}

mipg() {
clear
echo "Pop out?"
select tempsel in "Yes" "No"; do
    case $tempsel in
        Yes)
            Title="Magic Item Price Generator"
            git-bash "bash Magic\ Item\ Price\ Generator.sh"
            mainmenu
            ;;
        No)
            bash Magic\ Item\ Price\ Generator.sh
            mainmenu
            ;;
        *)
            wildcard mainmenu mipg
            ;;
    esac
done
}

# Start
mainmenu
