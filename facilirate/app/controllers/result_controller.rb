class ResultController < ApplicationController
  def showResult
    @args = params[:facility]
  end
end
