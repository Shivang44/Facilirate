class ResultController < ApplicationController
  def showResult
    @args = []

    #I know not correct, just messing with tables
    if(params[:facility].length > 0) then
        @args.push(FacilityType.where('ftype = ?', params[:facility]).first )
    end

    if(params[:building].length > 0) then
        @args.push(Building.where('name = ?', params[:building]).first )
    end
    #@args = [params[:facility], params[:building], params[:room]]


    #Steps:
    #Get all reviews into an array
    #If a ftype was given:
        #Keep only those that are of the right ftype, remove the result
    #If a building given:
        #Keep only those that are of the right name, remove the result
    #If a room number given:
        #Keep only those that are of the right number, remove the result

  end
end
