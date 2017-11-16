class ResultController < ApplicationController
  def showResult
    @args = params[:facility] + params[:building]
  end
end
