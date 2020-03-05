# Copycat Toolkit

![copycat](https://user-images.githubusercontent.com/54115104/74148826-68892a80-4c17-11ea-930a-07a40c026eef.jpeg)

<p align="center">
  <a href="http://entynetproject.simplesite.com/">
    <img src="https://img.shields.io/badge/entynetproject-Ivan%20Nikolsky-blue.svg">
  </a>
  <a href="https://github.com/entynetproject/copycat/releases">
    <img src="https://img.shields.io/github/release/entynetproject/copycat.svg">
  </a>
  <a href="https://wikipedia.org/wiki/Python_(programming_language)">
    <img src="https://img.shields.io/badge/language-python-blue.svg">
 </a>
  <a href="https://github.com/entynetproject/copycat/issues?q=is%3Aissue+is%3Aclosed">
      <img src="https://img.shields.io/github/issues/entynetproject/copycat.svg">
  </a>
  <a href="https://github.com/entynetproject/copycat/wiki">
      <img src="https://img.shields.io/badge/wiki%20-copycat-lightgrey.svg">
 </a>
  <a href="https://twitter.com/entynetproject">
    <img src="https://img.shields.io/badge/twitter-entynetproject-blue.svg">
 </a>
</p>

***

# About Copycat Toolkit

    Copycat Toolkit is a set of tools for getting information 
    about hostnames, domains, Internet-connected devices and etc. 
    Copycat Toolkit can be used to find specific types of devices 
    connected to the Internet using a variety of filters. 
    
***
    
# Getting started

## Copycat installation

> cd copycat

> chmod +x install.sh

> ./install.sh

## Copycat uninstallation

> cd copycat

> chmod +x uninstall.sh

> ./uninstall.sh

***

# Copycat Toolkit execution

> copycat help

                                      _   
                                     | |  
       ___ ___  _ __  _   _  ___ __ _| |_ 
      / __/ _ \| '_ \| | | |/ __/ _` | __|
     | (_| (_) | |_) | |_| | (_| (_| | |_ 
      \___\___/| .__/ \__, |\___\__,_|\__|
               | |     __/ |              
               |_|    |___/       

    Usage: copycat [option] <arguments>
    
      host     <host>                Show all available information for an IP.
      honeypot <host>                Check whether the IP is a honeypot or not.
      download <request> <filename>  Download search results as JSON database.
      parse    <format> <filename>   Extract information out of compressed JSON.
      stats    <request>             Provide summary information about a search.               
      search   <request>             Search the Internet database from Copycat.
      domain   <domain>              Show all available information for a domain.
      formats                        Show all available Copycat parse formats.
      stream                         Stream Copycat search results in real-time.
      radar                          The real-time map of Copycat search results.
      update                         Update Copycat Toolkit and API configuration.
      help                           Show all available Copycat Toolkit options.
 
***
 
# Copycat Toolkit examples

> Example of scanning a host
 
    copycat host 183.63.126.164
       
> Example of scanning a domain

    copycat domain github.com

> Example of checking if honeypot

    copycat honeypot 183.63.126.164

***

# Copycat Toolkit disclaimer

    Usage of the Copycat Toolkit for attacking targets without prior mutual consent is illegal. 
    It is the end user's responsibility to obey all applicable local, state, federal, and international laws. 
    Developers assume no liability and are not responsible for any misuse or damage caused by this program.

***

# Copycat Toolkit license

    MIT License

    Copyright (C) 2019-2020, Entynetproject. All Rights Reserved.

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
