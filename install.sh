#!/bin/bash

# MIT License
#
# Copyright (C) 2019, Entynetproject. All Rights Reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

RSA="\033[1;31m"
YSA="\033[1;33m"
#blue start 
	BS="-e \033[34m"
#color end
	CE="\033[0m"
#red start
	RS="-e \033[31m"
#green start
	GNS="-e \033[32m"

if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e ""$RS"This script must be run as root!"$CE"" 1>&2
   sleep 1
   exit
fi

if [[ -d ~/copycat ]]
then
sleep 0
else
cd ~
{
git clone https://github.com/entynetproject/copycat.git
} &> /dev/null
fi

sleep 0.5
clear
sleep 0.5
cd ~/copycat
cat banner/banner.txt
echo

sleep 1
echo ""$BS"Installing dependencies..."$CE""
sleep 1

{
pkg update
pkg -y install python
apt-get -y install python
apt-get -y install python-pip
apk update
apk add python
apk add py-pip
pacman -Sy
pacman -S --noconfirm python
pacman -S --noconfirm python-pip
zypper refresh
zypper install -y python
zypper install -y python-pip
yum -y install python
yum -y install python-pip
dnf -y install python
dnf -y install python-pip
eopkg update-repo
eopkg -y install python
eopkg -y install pip
xbps-install -S
xbps-install -y python
xbps-install -y python-pip
nix-env -i python
nix-env -i python2.7-bootstrapped-pip-19.2.3
} &> /dev/null

if [[ -f /usr/local/bin/shodan ]]
then
sleep 0.5
     if [[ -f ~/.shodan/api_key ]]
     then
     sleep 0.5
     else
     sleep 0.5
     SHO="PSKINdQe1GyxGgecYz2191H2JoS9qvgD"
     {
     shodan init "$SHO"
     } &> /dev/null
     fi
else
     sleep 0.5
     {
     pip install setuptools
     pip uninstall shodan -y
     easy_install shodan
     } &> /dev/null
sleep 0.5
SHO="PSKINdQe1GyxGgecYz2191H2JoS9qvgD"
{
shodan init "$SHO"
} &> /dev/null
fi

{
SED="$( cat ~/.shodan/api_key )"
} &> /dev/null
if [[ "$SED" != "PSKINdQe1GyxGgecYz2191H2JoS9qvgD" ]]
then 
{
rm ~/.shodan/api_key
echo PSKINdQe1GyxGgecYz2191H2JoS9qvgD >> ~/.shodan/api_key
} &> /dev/null
fi

{
cd ~/copycat/bin
cp copycat /usr/local/bin
chmod +x /usr/local/bin/copycat
cp copycat-radar /usr/local/bin
chmod +x /usr/local/bin/copycat-radar
cp copycat /bin
chmod +x /bin/copycat
cp copycat-radar /bin
cp copycat /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/usr/bin/copycat
cp copycat-radar /data/data/com.termux/files/usr/bin
chmod +x /data/data/com.termux/files/usr/bin/copycat-radar
chmod +x /bin/copycat-radar
chmod +x ~/copycat/copycat
chmod +x ~/copycat/copycat-radar
} &> /dev/null
