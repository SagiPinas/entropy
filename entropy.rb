require 'rubygems'
require 'socket.io-client-simple'
require 'json'

API_URL = "https://sagipinasV1.herokuapp.com"


socket = SocketIO::Client::Simple.connect API_URL

#!/usr/bin/env ruby

def sendReport(type, count, socket)

 incidentTypes = ['earthquake','fire','flooding','accident','landslide']

  reportData = {
    :id => "2695506260470251",
    :type => type,
    :specified => "",
    :details => "This just a test using entropy script",
    :location => {
      :lat=> "#{rand(4..20)}.509705",
      :long=> "#{rand(120..124)}.001852"
    },
    :status => "unverfied",
    :timestamp => Time.now
  }

  for i in 1..count.to_i
    sleep 0.3

    if type == "rand"
      reportData[:type] = incidentTypes[rand(0..incidentTypes.length()-1)]
    end
    puts "[SENT REPORT: #{reportData[:type]}] => #{Time.now}"
    socket.emit :test_report_data, reportData
  end
end


validArgTypes = ['earthquake','fire','flooding','accident','landslide','rand']

puts "=============================="
puts "Running Entropy test script..."
puts "=============================="

type = ARGV[0];
count = ARGV[1];

if count != "inf"
  if validArgTypes.include? type
    sendReport(type,count,socket)
  else
    puts "[FATAL ERROR]: unknown incident type provided: #{type}"
    puts "Please type rand if you want a random incident value."
  end
else
  puts "Infinite Requests: not supported yet"
end

