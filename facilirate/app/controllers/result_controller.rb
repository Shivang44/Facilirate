class ResultController < ApplicationController
  def showResult
    @args = [params[:facility], params[:building], params[:room]]
  end
end
