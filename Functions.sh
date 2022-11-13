#!/bin/bash

# Menu
PS3="Operation: "

Quit() {
if [[ $REPLY == 0 ]];
then
    $1
fi
}

TQuit() {
echo "Submit 0 to quit."
}

Incomplete() {
echo "Incomplete code. Please choose a different option."
pause
$1
}

git-bash() {
kitty -T="$Title" sh -c "$@" & > /dev/null 2&>1;
}

pause() {
    read -p 'Press enter to continue. . . . .'
}

echo "Functions Loaded"

wildcard() {
clear
Quit $1
echo "Invalid option $REPLY. Please choose something else"
pause
$2
}
