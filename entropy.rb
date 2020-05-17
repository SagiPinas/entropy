require 'rubygems'
require 'socket.io-client-simple'
require 'json'

API_URL = "http://127.0.0.1:7000"


socket = SocketIO::Client::Simple.connect API_URL

#!/usr/bin/env ruby


def sendReport(type, count, socket)

  reportData = {
    :id => "2695506260470251",
    :type => type,
    :specified => "",
    :details => "This just a test using entropy script",
    :location => {
      :lat=> "14.509705",
      :long=> " 121.001852"
    },
    :status => "cancelled",
    :timestamp => Time.now
  }

  for i in 0..count.to_i
    sleep 0.3
    socket.emit :test_report_data, reportData
  end
end



# ARGV.each do|a|
#   sleep 0.5
#   sendData(a, socket)
# end

types = ['earthquake','fire','flooding','accident','landslide']

puts "Running Entropy test script..."
puts "=============================="

type = ARGV[0];
count = ARGV[1];

if count != "inf"
  sendReport(type,count,socket)
else
  puts "Infinite Requests: not supported yet"
end


