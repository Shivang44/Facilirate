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
          @avgRating = (@userReviews.reduce(0) { |sum, current| sum + current.rating }) / @numberOfReviews.to_f
      end
  end

  def addReview
  end

  def notLoggedIn
  end
end
