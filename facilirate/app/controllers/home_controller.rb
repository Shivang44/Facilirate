class HomeController < ApplicationController
    # index(get types, get buildings, insert into html dropdown boxes)
  def index
      @types = FacilityType.all
  end
end
