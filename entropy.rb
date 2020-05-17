require 'rubygems'
require 'socket.io-client-simple'
require 'json'

API_URL = "https://sagipinasV1.herokuapp.com"


socket = SocketIO::Client::Simple.connect API_URL

#!/usr/bin/env ruby


# socket.on :connect do
#   puts "connected"
# end

# socket.on :disconnect do
#   puts "disconnected!!"
# end

# # socket.on :activity do |data|
# #   puts "> Activity interaction from API"
# # end

# socket.on :cancel_report do |data|
#   print "> Report cancellation \n"
#   print "====================== \n"
#   print JSON.pretty_generate(data)
# end

# socket.on :report do |data|
#   puts "> SENT Report"
# end



ARGV.each do|a|
  puts "Argument: #{a}"
end