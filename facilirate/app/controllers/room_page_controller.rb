class RoomPageController < ApplicationController
  def roomInfo

    @result = Room.find(params[:id])

    @avgReview = @result.avgRating
    @building = Building.find(@result.building_id).name
    @room = @result.roomNum
    @facility = @result.facilitytype_id

    @reviews = []
    @reviews = (Review.where('room_id = ?', params[:id]))

end
end
