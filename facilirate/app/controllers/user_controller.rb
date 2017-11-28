class UserController < ApplicationController
    # merge sign up and login
# GET this route => Get login form
# POST to this form => Log in user (username & password as params), redirect to home page
  def login
  end

  def signup
  end

  # Hunter Bernhardt
  # Updated by Shivang Saxena on 11/27/2017 to include number of posts and avg rating for user
  def viewProfile
      if !user_signed_in?
          redirect_to controller: 'user', action: 'notLoggedIn'
      else
          @reviews = (Review.where('user_id = ?', User.where('email = ?', current_user.email).first))

          # Get number of posts and average rating for user
          @user_id = User.where('email': current_user.email).first.id
          @userReviews = Review.where(user_id: @user_id).to_a
          @numberOfReviews = @userReviews.length
          if @numberOfReviews != 0 then
              @avgRating = (@userReviews.reduce(0) { |sum, current| sum + current.rating }) / @numberOfReviews.to_f
          else
              @avgRating = 0
          end
      end
  end

  def addReview
  end

  def notLoggedIn
  end

  def refresh
      if user_signed_in?
          redirect_to "/user/viewProfile"
      else
          redirect_to "/users/sign_up"
      end
  end

end
