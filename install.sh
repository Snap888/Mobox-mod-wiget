#!/bin/bash

rm ~/x

echo "Installing termux-am"
pkg install termux-am -y &>/dev/null

termux-setup-storage & sleep 4 &>/dev/null

while true; do
    if [ -d ~/storage/shared ]; then
        break
    else
        echo "Storage permission denied"
    fi
    sleep 3
done

echo "Installing termux packages"
apt-get clean
apt-get update >/dev/null 2>&1
apt-get -y --with-new-pkgs -o Dpkg::Options::="--force-confdef" upgrade >/dev/null 2>&1
pkg install x11-repo -y &>/dev/null
pkg install pulseaudio -y &>/dev/null
pkg install xwayland -y &>/dev/null
pkg install wget -y &>/dev/null
pkg install tsu -y &>/dev/null
pkg install root-repo -y &>/dev/null
pkg install patchelf -y &>/dev/null
pkg install p7zip -y &>/dev/null
pkg install xorg-xrandr -y &>/dev/null
pkg install ncurses-utils -y &>/dev/null
pkg install hashdeep -y &>/dev/null
pkg install termux-x11-nightly -y &>/dev/null

if [ -e $PREFIX/glibc ]; then
    echo -n "Removing previous glibc. Continue? (Y/n) "
    read i
    if [ "$i" = "Y" ] || [ "$i" = "y" ]; then
        rm -rf $PREFIX/glibc
    else
        return 1
    fi
fi

INSTALL_WOW64=0

echo "Select an option"
echo "1) Install previous mobox with box86"
echo "2) Install new mobox wow64 version"
echo ""
echo -n "Selected number: "
read i
case "$i" in
1)
    INSTALL_WOW64=0
;;
2)
    INSTALL_WOW64=1
;;
*)
    return 1
;;
esac

echo "Installing mobox"

