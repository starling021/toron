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

G="\033[1;34m[*] \033[0m"
S="\033[1;32m[+] \033[0m"
E="\033[1;31m[-] \033[0m"

if [[ -d /data/data/com.termux ]]
then
if [[ -f /data/data/com.termux/files/usr/bin/thoron ]]
then
UPD="true"
else
UPD="false"
fi
else
if [[ -f /usr/local/bin/thoron ]]
then
UPD="true"
else
UPD="false"
fi
fi
{
ASESR="$(ping -c 1 -q www.google.com >&/dev/null; echo $?)"
} &> /dev/null
if [[ "$ASESR" != 0 ]]
then 
   echo -e ""$E"No Internet connection!"
   exit
fi
if [[ $EUID -ne 0 ]]
then
echo -e ""$E"Permission denied!"
exit
fi
sleep 1
echo -e ""$G"Installing update..."
{
rm -rf ~/thoron
rm /bin/thoron
rm /usr/local/bin/thoron
rm /data/data/com.termux/files/usr/bin/thoron
cd ~
git clone https://github.com/entynetproject/thoron.git
if [[ "$UPD" != "true" ]]
then
sleep 0
else
cd thoron
chmod +x install.sh
./install.sh
fi
} &> /dev/null
echo -e ""$S"Successfully updated!"
cd .
touch .updated
sleep 1
exit
