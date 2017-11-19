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

ftypes.each do |type|
    FacilityType.create(ftype:type)
end

buildingNames.each do |bname|
    Building.create(name:bname)
end

rooms.each do |room|
    Room.create(roomNum: room[:roomNum], avgRating: room[:avgRating], building_id: room[:building_id])
end
