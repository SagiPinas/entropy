require 'rubygems'
require 'socket.io-client-simple'
require 'json'

API_URL = "https://sagipinasV1.herokuapp.com"

socket = SocketIO::Client::Simple.connect API_URL

#!/usr/bin/env ruby

def sendReport(type, count, socket,delay)

 incidentTypes = ['earthquake','fire','flooding','accident','landslide']

  for i in 1..count.to_i

    sleep delay.to_f

    reportData = {
      :id => "2695506260470251",
      :type => type,
      :specified => "",
      :details => "This just a test using entropy script",
      :location => {
        :lat=> "14.50#{rand(1000..9705)}",
        :long=> "121.00#{rand(1000..1852)}"
      },
      :status => "unverified",
      :timestamp => Time.now
    }

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

type = ARGV[0]
count = ARGV[1]
delay = ARGV[2]

if count != "inf"
  if validArgTypes.include? type
    sendReport(type,count,socket,delay)
  else
    puts "[FATAL ERROR]: unknown incident type provided: #{type}"
    puts "Please type rand if you want a random incident value."
  end
else
  puts "Infinite Requests: not supported yet"
end
