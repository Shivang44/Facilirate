# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ftypes = [
    "Bathroom",
    "Lab",
    "Other",
    "Classroom"
]

buildingNames = [
    "Scott",
    "Caldwell",
    "SEL",
    "Dreese Lab"
]

rooms = [
    {
        roomNum: "112",
        avgRating: 5.0,
        building_id: 2
    },
    {
        roomNum: "172",
        avgRating: 4.2,
        building_id: 4
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
]

ftypes.each do |type|
    FacilityType.create(ftype:type)
end

buildingNames.each do |bname|
    Building.create(name:bname)
end

rooms.each do |room|
    Room.create(roomNum: room[:roomNum], avgRating: room[:avgRating], building_id: room[:building_id])
end

reviews.each do |review|
    Review.create(review: review[:review], rating: review[:rating], user_id: review[:user_id], room_id: review[:room_id])
end
