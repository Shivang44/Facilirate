class UserController < ApplicationController
  # Hunter Bernhardt
  # Updated by Shivang Saxena on 11/27/2017 to include number of posts and avg rating for user
  # Updated by Matthew Deavers on 11/27/2017 to redirect requests for /user to a signup or profile page
  def viewProfile
      if !user_signed_in?
          redirect_to controller: 'user', action: 'notLoggedIn'
      else
          user = User.where('email': current_user.email).first
          @reviews = (Review.where('user_id = ?', user).order(created_at: :desc))

          @numberOfReviews = @reviews.length
          if @numberOfReviews != 0 then
              @avgRating = (@reviews.reduce(0) { |sum, current| sum + current.rating }) / @numberOfReviews.to_f
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
