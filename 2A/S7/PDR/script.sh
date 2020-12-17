#!/bin/bash

PS3='Terminator options: '
options=("Split 1" "Split 2" "Split 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Split 1")
            config=config-1
            break
            ;;
        "Split 2")
            config=config-2
            break
            ;;
        "Split 3")
            config=config-3
            break
            ;;
        *)
            exit
            ;;
    esac
done

cd ~/.config/terminator
cp config config-
cp $config config
cd
terminator &
