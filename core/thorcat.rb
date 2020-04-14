#!/usr/bin/env ruby

#            ---------------------------------------------------
#                              Thor Framework                                                                     
#            ---------------------------------------------------
#                Copyright (C) <2019-2020>  <Entynetproject>
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

def randz
  (0...1).map{ ('0'..'3').to_a[rand(4)] }.join
end

class ThorCat
  def initialize
    require 'ostruct'
    require 'socket'
    require 'open3'
  end

  def listener(port=31337, ip=nil)
    if ip.nil?
      server = TCPServer.new(port)
      server.listen(1)
      @socket = server.accept
    else
      @socket = TCPSocket.open(ip, port)
    end
    e = "\033[1;31m[-] \033[0m"
    p = "\033[1;77m[>] \033[0m"
    g = "\033[1;34m[*] \033[0m"
    s = "\033[1;32m[+] \033[0m"
    h = "\033[1;77m[@] \033[0m"
    puts "#{g}Handling new connection..."
    sleep(0.5)
    puts "#{g}Sending payload to target..."
    sleep(0.5)
    puts "#{g}Connecting to target..."
    sleep(0.5)
    puts "#{g}Opening target shell..."
    sleep(1)
    while(true)
      if(IO.select([],[],[@socket, STDIN],0))
        socket.close
        return
      end
      begin
        while( (data = @socket.recv_nonblock(100)) != "")
          STDOUT.write(data);
        end
        break
      rescue Errno::EAGAIN
      end
      begin
        while( (data = STDIN.read_nonblock(100)) != "")
          @socket.write(data);
        end
        break
      rescue Errno::EAGAIN
      rescue EOFError
        break
      end
      IO.select([@socket, STDIN], [@socket, STDIN], [@socket, STDIN])
    end
  end
end

options = {}
optparse = OptionParser.new do |opts| 
  opts.banner = "Usage: #{$0} [OPTIONS]"
  opts.separator ""
  opts.separator "Options: "
  opts.on('-c', '--connect', "\n\tSimple Connector.") do |mode|
    options[:method] = 0
  end
  opts.on('-l', '--listen', "\n\tSetup Listener.") do |mode|
    options[:method] = 1
  end
  opts.on('-b', '--bind', "\n\tSetup Bind Shell.") do |mode|
    options[:method] = 2
  end
  opts.on('-r', '--reverse', "\n\tSetup Reverse Shell.") do |mode|
    options[:method] = 3
  end
  opts.on('-i', '--ip IP', "\n\tIP for Reverse Shell Connection.") do |ip|
    options[:ip] = ip.chomp
  end
  opts.on('-p', '--port PORT', "\n\tPort to use for Connection.") do |port|
    options[:port] = port.to_i
  end
  opts.on('-P', '--pass PASS', "\n\tPassword for Bind Shell.") do |pass|
    options[:pass] = pass
  end
  opts.on('-h', '--help', "\n\tHelp Menu.") do 
    puts opts
    exit 69;
  end
end
begin
  foo = ARGV[0] || ARGV[0] = "-h"
  optparse.parse!
  if options[:method].to_i == 3 or options[:method].to_i == 0
    mandatory = [:method,:port,:ip]
  else
    mandatory = [:method,:port]
  end
  missing = mandatory.select{ |param| options[param].nil? }
  if not missing.empty?
    puts
    puts "Missing options: #{missing.join(', ')}"
    puts optparse
    exit 666;
  end
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts
  puts $!.to_s
  puts
  puts optparse
  puts
  exit 666;   
end

rc = ThorCat.new
case options[:method].to_i
when 0
  rc.listener(options[:port].to_i, options[:ip])
when 1
  rc.listener(options[:port].to_i)
when 2
  if options[:pass].nil?
    rc.bind_shell(options[:port].to_i)
  else
    rc.bind_shell(options[:port].to_i, options[:pass].to_s)
  end
when 3
  rc.reverse_shell(options[:ip], options[:port].to_i)
end
