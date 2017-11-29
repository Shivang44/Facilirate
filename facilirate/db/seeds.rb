require 'open-uri'
require 'json'

ftypes = [
    "Bathroom",
    "Lab",
    "Other",
    "Classroom"
]

ftypes.each do |type|
    FacilityType.create(ftype:type)
end

# This fetches all OSU buildings from https://www.osu.edu/map/buildingindex.php
# and inserts into DB.
# OSU building id's are in the range [001, 1260]
puts "Fetching and inserting all OSU buildings into DB. Grab some coffee, this will probably take a while."
1261.times do |id|
    response = open('https://www.osu.edu/map/inc/google/v2/points.php?query_type=7&query=' + ("%.3d" % id)).read
    if (response != "null")
        responseHash = JSON.parse(response)[0]
        buildingName = responseHash["name"]
        longitude = responseHash["longitude"]
        latitude = responseHash["latitude"]
        Building.create(name:buildingName, longitude:longitude, latitude:latitude)
        puts "Fetched data for and added building \"#{buildingName}\" to the buildings DB."
    end
end
