class RoomPageController < ApplicationController

  # Gets information for a particular room and creates a page for it
  # Written by Dilroop Raju on 11/26/2017
  # Edited by Hunter Bernhardt on 11/30/17 to have an updated average rating
  def roomInfo

    @result = Room.find(params[:id])

    @building = Building.find(@result.building_id).name
    @buildinLong = Building.find(@result.building_id).longitude
    @buildingLat = Building.find(@result.building_id).latitude
    @room = @result.roomNum
    @facility = @result.facilitytype_id

    @reviews = []
    @reviews = (Review.where('room_id = ?', params[:id])).order(created_at: :desc)

    @numberOfReviews = @reviews.length
    if @numberOfReviews != 0 then
        @avgReview = (@reviews.reduce(0) { |sum, current| sum + current.rating }) / @numberOfReviews.to_f
    else
        @avgReview = 0.0
    end

  end

end
