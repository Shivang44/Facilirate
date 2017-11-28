class RoomPageController < ApplicationController
  def roomInfo

    @result = Room.where(params[:id]).first
    @avgReview = @result.avgRating
    @building = Building.find(@result.building_id).name
    @room = @result.roomNum
    @facility = @result.facilitytype_id

    @reviews = []
    @reviews = (Review.where('room_id = ?', @roomParm))

end
end
