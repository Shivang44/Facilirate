class Review < ActiveRecord::Base
    belongs_to :user, :room
end
