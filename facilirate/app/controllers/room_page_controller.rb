class RoomPageController < ApplicationController
  def roomInfo
    @buildingParam = params[:building]
    @building = Building.where(name:@buildingParam).pluck(:id)
    @roomParam = params[:room]
    @facilityParam = params[:facility]

    #roomNum and building_id required
    @result = Room.where(roomNum:@roomParam, building_id:@building).first
    facility = (FacilityType.where('id = ?', @result.facilitytype_id).first)
    if facility != nil then
        type = facility.ftype
    else
        type = "Other"
    end
    @averageRating = @result.avgRating
    @reviews = []
    @reviews = (Review.where('room_id = ?', @roomParm))

end
end
