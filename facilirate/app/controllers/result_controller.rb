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
                @tempVal = Room.find(val)
                @finalResult.push(@tempVal)
            end
        end
    end



end
