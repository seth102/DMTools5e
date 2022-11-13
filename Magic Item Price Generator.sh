#!/bin/bash

# Functions
. Functions.sh

mainmenu() {
clear
echo "Welcome to Alexia's Magic Item price generator for 5e."
TQuit
echo "Please choose an option from below."

select tempsel in "Common Magic Item" "Uncommon Magic Item" "Rare Magic Item" "Very Rare Magic Item" "Ledgendary Magic Item";  do
    case $tempsel in
        Common\ Magic\ Item)
            common
            mainmenu
            ;;
        Uncommon\ Magic\ Item)
            uncommon
            mainmenu
            ;;
        Rare\ Magic\ Item)
            rare
            mainmenu
            ;;
        Very\ Rare\ Magic\ Item)
            veryrare
            mainmenu
            ;;
        Ledgendary\ Magic\ Item)
            ledgendary
            mainmenu
            ;;
        *)
            wildcard exit mainmenu
    esac
done
}

common() {
clear
read -p "How many Common Magic Items would you like to generate?" tempin
count=1
until [[ $tempin == 0 ]]; do
    echo "Item $count: $(( $RANDOM % 51 + 49 ))"
    let count+=1
    let tempin-=1
done
pause
}

uncommon() {
clear
read -p "How many Uncommon Magic Items would you like to generate?" tempin
count=1
until [[ $tempin == 0 ]]; do
    echo "Item $count: $(( $RANDOM % 400 + 100 ))"
    let count+=1
    let tempin-=1
done
pause
}

rare() {
clear
read -p "How many Rare Magic Items would you like to generate?" tempin
count=1
until [[ $tempin == 0 ]]; do
    echo "Item $count: $(( $RANDOM % 4500 + 500 ))"
    let count+=1
    let tempin-=1
done
pause
}

veryrare() {
clear
read -p "How many Very rare Magic Items would you like to generate?" tempin
count=1
until [[ $tempin == 0 ]]; do
    echo "Item $count: $(( $RANDOM % 45000 + 5000 ))"
    let count+=1
    let tempin-=1
done
pause
}

ledgendary() {
clear
read -p "How many Ledgendary Magic Items would you like to generate?" tempin
count=1
until [[ $tempin == 0 ]]; do
    echo "Item $count: $(( $RANDOM + 50000 ))"
    let count+=1
    let tempin-=1
done
pause
}

mainmenu
