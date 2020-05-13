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

#blue start 
	BS="-e \033[1;34m"
#color end
	CE="\033[0m"
#red start
	RS="\033[1;31m"
	C="\033[0m"
#green start
	GN="\033[1;32m"
#white start
  WHS="\033[0m"

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
   echo -e ""$RS"[-] "$WHS"No Internet connection!"$CE""
   exit
fi
if [[ $EUID -ne 0 ]]
then
echo -e ""$RS"[-]"$CE" Permission denied!"$CE""
exit
fi
sleep 1
echo -e ""$BS"[*]"$CE" Installing update..."$CE""
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
echo -e ""$GN"[+]"$CE" Successfully updated!"$CE""
cd .
touch .updated
sleep 1
exit
