class FacilityController < ApplicationController
    # FQDM.com/facility/id
    # params it takes: id of room
    # what it returns: AVG review/rating, room/building name, and individual reviews
    def show
    end

    # Returns a blank form to create a review for a facility
    def new
        # Check if user is logged in
        if !user_signed_in?
            redirect_to controller: 'user', action: 'notLoggedIn'
        else
            # Get all building names in ascending order
            @buildings = Building.all.order(name: :asc).to_a.map {
                |building| building.name
            }

            # Same with facility types and room numbers
            @facilitytypes = FacilityType.all.order(ftype: :asc).to_a.map {
                |facilityType| facilityType.ftype
            }

            @rooms = Room.all.order(roomNum: :asc).to_a.map {
                |room| room.roomNum
            }
        end
    end

    # actually creates review for the specified facility
    # it takes in: rating+review, room_id, user_info
    # result of calling this action: redirection facility review of this id
    def create
    end
end
