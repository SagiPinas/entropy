
# test function for generating random gps coordinates on a given bounding box, this time, it's the philippines.

def randomLatLng()
  max_north=18.8
  min_north=14
  max_east=122
  min_east=121.5
  puts "#{rand(min_north..max_north)},#{rand(min_east..max_east)}"
end

randomLatLng()