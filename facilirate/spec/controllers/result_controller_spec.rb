require "rails_helper"

describe ResultController do

  it "GET #showAll" do
    allRoom = Room.all
    get :showResult
    assigns(:rooms) == ([allRoom])
  end
  
  
  it "renders the :showAll view" do
    get :showAll
     
    expect(response).to render_template("showAll") 
  end
  render_views
  it "renders the :showAll view" do
    get :showAll
    expect(response.body).to match("Room")
  end

end