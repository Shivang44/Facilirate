class FacilityController < ApplicationController


    # Written by Hunter Bernhardt on 11/29/2017
    def delete
        postID = params[:id]
        review = Review.find(postID)
        room = Room.find(review.room_id)
        allReviews = Review.where('room_id = ?', room.id)
        currTotal = room.avgRating * allReviews.length
        currTotal = currTotal - review.rating
        if(allReviews.length - 1 > 0) then
            currTotal = currTotal / (allReviews.length - 1)
            room.avgRating = currTotal
            room.save
        else
            currTotal = 0.0
        end
        review.destroy
        redirect_to(:back)
    end

    # Returns a blank form to create a review for a facility
    # Written by Shivang Saxena on 11/26/2017
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
    # Written by Shivang Saxena on 11/27/2017
    def create
        # TODO: Do a server-side validation of all params in addition to client side (html) validation
            # Also sanitize input -- escape any javascript and html
        # TODO: Add validations/constrictions to DB
        building = params[:building]
        room = params[:room]
        facilityType = params[:facility]
        review = params[:review]
        rating = params[:rating]


        # Create room if it is not already in DB
        if Room.where(roomNum: room).count == 0
            buildingId = Building.where(name: building).first.id # TODO: Validate building id found
            facilityTypeId = FacilityType.where(ftype: facilityType).first.id
            Room.create(roomNum: room, avgRating: 0, building_id: buildingId, facilitytype_id: facilityTypeId)
        end

        # Add review
        roomId = Room.where(roomNum: room).first.id
        Review.create(review: review, rating: rating, user_id: current_user.id, room_id: roomId)

        # Get the number of reviews for this room so we can calculate the new average
        reviews = Review.where(room_id: roomId).to_a
        nReviews = reviews.length
        reviewSum = reviews.reduce(0) { |sum, review| sum + review.rating}
        newAvg = reviewSum / nReviews

        # Update rating average for room
        currentRoom = Room.find(roomId)
        currentRoom.avgRating = newAvg
        currentRoom.save


        # Redirect user to resuts page
        redirect_to controller: 'home', action: 'index'
    end
    def editReview
      # TODO: Do a server-side validation of all params in addition to client side (html) validation
          # Also sanitize input -- escape any javascript and html
      # TODO: Add validations/constrictions to DB
      @building = params[:building]
      @room = params[:room]
      @facilityType = params[:facility]
      @review = params[:review]
      @rating = params[:rating]

      @newReview = Review.find_by_id(params[:id])

      @newReview.review = @review
      @newReview.rating = @rating
      @newReview.save

      roomId = Room.where(roomNum: @room).first.id
      # Get the number of reviews for this room so we can calculate the new average
      reviews = Review.where(room_id: roomId).to_a
      nReviews = reviews.length
      reviewSum = reviews.reduce(0) { |sum, review| sum + review.rating}
      newAvg = reviewSum / nReviews

      # Update rating average for room
      currentRoom = Room.find(roomId)
      currentRoom.avgRating = newAvg
      currentRoom.save

      # Redirect user to results page
      redirect_to controller: 'home', action: 'index'
    end

    def show
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
      @id = params[:id]
    end
    def edit
    end
end
