class RoomPageController < ApplicationController

  #Gets information for a particular room and creates a page for it
  #Written by Dilroop Raju on 11/26/2017

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
