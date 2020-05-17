require 'rubygems'
require 'socket.io-client-simple'

API_URL = "https://sagipinasV1.herokuapp.com"


socket = SocketIO::Client::Simple.connect API_URL


socket.on :connect do
  puts "connected"
end

socket.on :disconnect do
  puts "disconnected!!"
end

socket.on :activity do |data|
  puts "> Activity interaction from API"
end


puts "Press any key to close connection to server"

loop do
  msg = STDIN.gets.strip
  next if msg.empty?
end
