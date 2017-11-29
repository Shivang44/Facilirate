class ResultController < ApplicationController

    def showAll
    end

    def showResult
        @facil = false
        @building = false

        calculateResults params  #uses user entered filter and return with necessary array to show

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
    end



end
