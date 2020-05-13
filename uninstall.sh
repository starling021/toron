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
BS="-e \033[1;34m"

R="\033[1;31m"
WS="\033[0m"

printf '\033]2;uninstall.sh\a'

if [[ $EUID -ne 0 ]]
then
   echo -e ""$RS"[-]"$WS" This script must be run as root!"$CE"" 1>&2
   exit
fi

{
rm -rf ~/thoron
rm /bin/thoron
rm /usr/local/bin/thoron
rm /data/data/com.termux/files/usr/bin/thoron
} &> /dev/null
