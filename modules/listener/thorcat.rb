#!/usr/bin/env ruby

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

i = "\033[1;77m[i] \033[0m"
e = "\033[1;31m[-] \033[0m"
p = "\033[1;77m[>] \033[0m"
g = "\033[1;34m[*] \033[0m"
s = "\033[1;32m[+] \033[0m"
h = "\033[1;77m[@] \033[0m"
r = "\033[1;77m[#] \033[0m"

require 'optparse'
require 'ostruct'

options = OpenStruct.new
OptionParser.new do |opt|
    opt.on('-h', '--local-host <local_host>', 'Local host.') { |o| options.local_host = o }
    opt.on('-p', '--local-port <local_port>', 'Local port.') { |o| options.local_port = o }
    opt.on('-h', '--help', "Show options.") do
        puts "Usage: thorcat.rb [-h] --local-host=<local_host>"
        puts "                  --local-port=<local_port>"
        puts ""
        puts "  -h, --help                     Show options."
        puts "  --local-host=<local_host>      Local host."
        puts "  --local-port=<local_port>      Local port."
        abort()
    end
end.parse!

host = options.local_host
port = options.local_port

if not host or not port
    puts "Usage: thorcat.rb [-h] --local-host=<local_host>"
    puts "                  --local-port=<local_port>"
    puts ""
    puts "  -h, --help                     Show options."
    puts "  --local-host=<local_host>      Local host."
    puts "  --local-port=<local_port>      Local port."
    abort()
end

system("ruby core/thorcat.rb -l #{host} -p #{port}")
