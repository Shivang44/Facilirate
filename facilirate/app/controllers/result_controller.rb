class ResultController < ApplicationController

    def showResult
        @facil = false
        @building = false

        calculateResults params 

        @finalResult = []
        if(@result)
            @result.each do |id|
                @tempVal = Room.find(id)
                @finalResult.push(@tempVal)
            end
        end
    end

end
