require 'open-uri'
require 'json'

ftypes = [
    "Bathroom",
    "Lab",
    "Other",
    "Classroom"
]

rooms = [
    {
        roomNum: "112",
        avgRating: 3.0,
        building_id: 2,
        facilitytype_id: 2
    },
    {
        roomNum: "172",
        avgRating: 4.2,
        building_id: 4,
        facilitytype_id: 1
    }
]

reviews = [
    {
        review: "This is an okay thing",
        rating: 3.5,
        user_id: 1,
        room_id: 1
    },

    {
        review: "This is a good thing",
        rating: 4.5,
        user_id: 1,
        room_id: 1
    },

    {
        review: "This is a bad thing",
        rating: 1.2,
        user_id: 1,
        room_id: 1
    },

    {
        review: "This is an average thing",
        rating: 3.5,
        user_id: 1,
        room_id: 1
    },

    {
        review: "This is an extremely good thing",
        rating: 5.0,
        user_id: 1,
        room_id: 1
    },

    {
        review: "This is an extremely bad thing",
        rating: 1.0,
        user_id: 1,
        room_id: 1
    },
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
        Building.create(name:buildingName)
        puts "Fetched data for and added building \"#{buildingName}\" to the buildings DB."
    end
end

rooms.each do |room|
    Room.create(roomNum: room[:roomNum], avgRating: room[:avgRating], building_id: room[:building_id])
end

reviews.each do |review|
    Review.create(review: review[:review], rating: review[:rating], user_id: review[:user_id], room_id: review[:room_id])
end
