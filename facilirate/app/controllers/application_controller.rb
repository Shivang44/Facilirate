class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method:calculateResults

  def calculateResults (param)

    params = param

    if(params[:facility] && params[:facility].length > 1) then
      @temp = params[:facility]
      @facil = FacilityType.where(ftype:@temp).pluck(:id)
    end

  #obtain buildings id
    if(params[:building] && params[:building].length > 0) then
        @temp = params[:building]
        @building = Building.where(name:@temp).pluck(:id)
    end

    #get result from the applied filters
    if(params[:room] && params[:room].length > 0) then
        @tempRoom = params[:room]
        if( @building && @building.length> 0)
            if(@facil && @facil.length>0) #building, room and facility is provided
                @result = Room.where(roomNum:@tempRoom, building_id:@building, facilitytype_id:@facil)
            else #just building and room is given
                @result = Room.where(roomNum:@tempRoom, building_id:@building)
            end
        elsif(@facil && @facil.length>0)#just facility is given
            @result = Room.where(roomNum:@tempRoom, facilitytype_id:@facil)
        else #no building and facility given just room
            @result = Room.where(roomNum:@tempRoom)
        end

    elsif (@building && @building.length > 0)

        if(@facil && @facil.length>0) #building is given and facility is given
            @result = Room.where(building_id:@building, facilitytype_id:@facil)
        else #only building given
            @result = Room.where(building_id:@building)
        end

    elsif (@facil && @facil.length>0) #no building given, no room given, just facility type
            @result = Room.where(facilitytype_id:@facil)
    else
        #redirect_to "/result/showAll" #nothing was given
        @result = Room.all
    end
    @result = @result.pluck(:id)
    return @result

  end

end
