class HomeController < ApplicationController
    # index(get types, get buildings, insert into html dropdown boxes)
    # Hunter Bernhardt
  def index
      @types = FacilityType.all.to_a.sort! { |a, b| a.ftype <=> b.ftype }
      @buildings = Building.all.to_a.sort! { |a, b| a.name <=> b.name }
  end

end
