#!/bin/bash

# MIT License

# Copyright (C) 2019, Entynetproject. All Rights Reserved.

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

if [[ -d /System/Library/CoreServices/Finder.app ]]
then
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
else
RSA="\e[1;31m"
YSA="\e[1;33m"
#blue start 
	BS="-e \e[0;34m"
#color end
	CE="\e[0m"
#red start
	RS="-e \e[0;31m"
#green start
	GNS="-e \e[0;32m"
fi

if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e "["$RSA"*"$CE"] "$RSA"This script must be run as "$YSA"root"$CE""
   sleep 1
   exit
fi

if [[ -d ~/copycat ]]
then
cd ~/copycat/bin
{
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
else
cd ~
{
git clone https://github.com/entynetproject/copycat.git
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
fi
sleep 0.5
clear
sleep 0.5
echo  
cd ~/copycat
cat banner/banner.txt
echo

if [[ -f /etc/copycat.conf ]]
then

CONF="$( cat /etc/copycat.conf )"
sleep 1

if [[ "$CONF" = "arm" ]]
then
if [[ -d /System/Library/CoreServices/SpringBoard.app ]]
then
echo ""$BS"Installing dependencies..."$CE""
else 
echo ""$BS"Installing dependencies..."$CE""
pkg update
pkg -y install python2
pkg -y install python-pip
fi
fi

if [[ "$CONF" = "amd" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo ""$BS"Installing dependencies..."$CE""
else
echo ""$BS"Installing dependencies..."$CE""
apt-get update
apt-get -y install python2
apt-get -y install python-pip
fi
fi

if [[ "$CONF" = "intel" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo ""$BS"Installing dependencies..."$CE""
else
echo ""$BS"Installing dependencies..."$CE""
apt-get update
apt-get -y install python2
apt-get -y install python-pip
fi
fi

else
read -e -p $'Select your architecture (amd/intel/arm): ' CONF
if [[ "$CONF" = "" ]]
then
exit
else
if [[ "$CONF" = "arm" ]]
then
read -e -p $'Is this a single board computer (yes/no)? ' PI
if [[ "$PI" = "yes" ]]
then
echo "amd" >> /etc/copycat.conf
CONF="amd"
else
echo "$CONF" >> /etc/copycat.conf
fi
fi
fi
sleep 1

if [[ "$CONF" = "arm" ]]
then
if [[ -d /System/Library/CoreServices/SpringBoard.app ]]
then
echo ""$BS"Installing dependencies..."$CE""
else 
echo ""$BS"Installing dependencies..."$CE""
pkg update
pkg -y install python2
pkg -y install python-pip
fi
fi

if [[ "$CONF" = "amd" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo ""$BS"Installing dependencies..."$CE""
else
echo ""$BS"Installing dependencies..."$CE""
apt-get update
apt-get -y install python2
apt-get -y install python-pip
fi
fi

if [[ "$CONF" = "intel" ]]
then
if [[ -d /System/Library/CoreServices/Finder.app ]]
then
echo ""$BS"Installing dependencies..."$CE""
else
echo ""$BS"Installing dependencies..."$CE""
apt-get update
apt-get -y install python2
apt-get -y install python-pip
fi
fi
fi

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
     pip install shodan
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
