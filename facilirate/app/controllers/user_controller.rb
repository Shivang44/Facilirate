class UserController < ApplicationController
    # merge sign up and login
# GET this route => Get login form
# POST to this form => Log in user (username & password as params), redirect to home page
  def login
  end

  def signup
  end
  
  # Hunter Bernhardt
  def viewProfile
      if !user_signed_in?
          redirect_to controller: 'user', action: 'notLoggedIn'
      else
          @reviews = (Review.where('user_id = ?', User.where('email = ?', current_user.email).first))
      end
  end

  def addReview
  end

  def notLoggedIn
  end
end
