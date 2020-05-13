#!/bin/bash

#            ---------------------------------------------------
#                             Thoron Framework                                
#            ---------------------------------------------------
#                  Copyright (C) <2020>  <Entynetproject>       
#
#        This program is free software: you can redistribute it and/or modify
#        it under the terms of the GNU General Public License as published by
#        the Free Software Foundation, either version 3 of the License, or
#        any later version.
#
#        This program is distributed in the hope that it will be useful,
#        but WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#        GNU General Public License for more details.
#
#        You should have received a copy of the GNU General Public License
#        along with this program.  If not, see <http://www.gnu.org/licenses/>.

N="\033[1;37m"
C="\033[0m"

CE="\033[0m"
RS="\033[1;31m"
YS="\033[1;33m"
BS="-e \033[1;34m[*]\033[0m "
GNS="-e \033[1;32m[+]\033[0m "

R="\033[1;31m"
WS="\033[0m"

printf '\033]2;install.sh\a'

if [[ $EUID -ne 0 ]]
then
   echo -e ""$RS"[-]"$WS" This script must be run as root!"$CE""
   exit
fi

{
ASESR="$(ping -c 1 -q www.google.com >&/dev/null; echo $?)"
} &> /dev/null
if [[ "$ASESR" != 0 ]]
then 
   echo -e ""$RS"[-] "$WHS"No Internet connection!"$CE""
   exit
fi

sleep 0.5
clear
sleep 0.5
cat banner/banner.txt
echo

sleep 1
echo ""$BS"Installing dependencies..."$CE""
sleep 1

{
pkg update
pkg -y install git
pkg -y install ruby
apt-get update
apt-get -y install git
apt-get -y install ruby
apk update
apk add git
apk add ruby
pacman -Sy
pacman -S --noconfirm git
pacman -S --noconfirm ruby
zypper refresh
zypper install -y git
zypper install -y ruby
yum -y install git
yum -y install ruby
dnf -y install git
dnf -y install ruby
eopkg update-repo
eopkg -y install git
eopkg -y install ruby
xbps-install -S
xbps-install -y git
xbps-install -y ruby
} &> /dev/null

if [[ -d ~/thoron ]]
then
sleep 0
else
cd ~
{
git clone https://github.com/entynetproject/thoron.git
} &> /dev/null
fi

{
cd bin
cp thoron /usr/local/bin
chmod +x /usr/local/bin/thoron
cp thoron /bin
chmod +x /bin/thoron
cp thoron /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/usr/bin/thoron
} &> /dev/null

sleep 1
echo ""$GNS"Successfully installed!"$CE""
sleep 1
