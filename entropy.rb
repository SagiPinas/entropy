require 'rubygems'
require 'socket.io-client-simple'
require 'json'

API_URL = "https://sagipinasV1.herokuapp.com"


socket = SocketIO::Client::Simple.connect API_URL


socket.on :connect do
  puts "connected"
end

socket.on :disconnect do
  puts "disconnected!!"
end

# socket.on :activity do |data|
#   puts "> Activity interaction from API"
# end

socket.on :cancel_report do |data|
  puts "> report cancellation"
  puts "======================"
end

socket.on :report do |data|
  puts "> SENT Report"
end

puts "Press any key to close connection to server"

loop do
  msg = STDIN.gets.strip
  next if msg.empty?
end
