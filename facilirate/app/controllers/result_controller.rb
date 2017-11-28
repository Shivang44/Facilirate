class ResultController < ApplicationController
    @showResult = []

    def showAll
        @rooms = Room.all
        @tempOrder = params[:order]

        if @tempOrder == "ascend"
            @rooms = @rooms.sort{|left, right| 

                    left.avgRating <=> right.avgRating
                }
        elsif @tempOrder == "descend"
            @rooms = @rooms.sort{|left, right| 
                    right.avgRating <=> left.avgRating
                }
        end
    end

    def showResult
        @facil = false
        @building = false
        #obtain facility type id
        if(params[:facility] && params[:facility].length > 1) then
            @temp = params[:facility]
            @facil = FacilityType.where(ftype:@temp).pluck(:id)
            @facilType = FacilityType.where(ftype:@temp).pluck(:ftype)
            @facilParms = params[:facility]
        end

        #obtain buildings id
        if(params[:building] && params[:building].length > 0) then
            @temp = params[:building]
            @building = Building.where(name:@temp).pluck(:id)
            @buildingName = Building.where(name:@temp).pluck(:name)
            @buildingParms = params[:building]
        end
        #get
        if(params[:room] && params[:room].length > 0) then
            @tempRoom = params[:room]
            @roomParms = params[:room]
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
            redirect_to "/result/showAll"
        end

        @finalResult = [] 
        if(@result)
            @result = @result.pluck(:id) #has list of all id that matches result
            @result.each do |val|
                @tempVal = Room.where(id:val) 
                @roomTemp = @tempVal.pluck(:roomNum)
                @avgRateTemp = @tempVal.pluck(:avgRating)
                @buildingTemp = Building.where(id:(@tempVal.pluck(:building_id))).pluck(:name)
                @facilityTemp = FacilityType.where(id:(@tempVal.pluck(:facilitytype_id))).pluck(:ftype)
                @temp = []
                @temp.push(@roomTemp,@avgRateTemp,@buildingTemp,@facilityTemp,@tempVal)
                @finalResult.push(@temp)
            end
        end

        @tempOrder = params[:order]
        if @tempOrder == "ascend"
            @finalResult.sort{|left, right| 
                    left[1]<=>right[1]
                }
        elsif @tempOrder == "descend"
            @finalResult.sort{|left, right| 
                    left[1]<=>right[1]
                }
        end
    end

    def filterResult
        @order = params[:order]
        @param = params[:allParm]

        if @param.kind_of?(Array)  
            @fail = @param[0]
            @buildin = @param[1]
            @roomNum = @param[2]
            redirect_to controller: 'result', action: 'showResult', order: @order, facility: @facil, building: @buildin, room: @roomNum
        elsif @param == "allRooms"  
            redirect_to controller: 'result' , action: 'showAll', order: @order
        end
    end

end
