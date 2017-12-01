require "rails_helper"

describe HomeController do

  it "GET #index" do
    types = FacilityType.all.to_a.sort! { |a, b| a.ftype <=> b.ftype }
    get :index
  end


  it "renders the :index view" do
    get :index

    expect(response).to render_template("index")
  end
  render_views
end
