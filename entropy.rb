require 'rubygems'
require 'socket.io-client-simple'
require 'json'

API_URL = "https://sagipinasV1.herokuapp.com"

socket = SocketIO::Client::Simple.connect API_URL

#!/usr/bin/env ruby

# random bounding box

def randomLatLng()
  max_north=18.8
  min_north=14
  max_east=122
  min_east=121.5
  puts "#{rand(min_north..max_north)},#{rand(min_east..max_east)}"
end

def randLat()
  max_lat=18.8
  min_lat=14
  puts rand(min_lat..max_lat);
end

def randLng()
  max_lng=122
  min_lng=121.5
  puts rand(min_lng..max_lng);
end

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
        :lat=> randLat(),
        :long=> randLng()
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
