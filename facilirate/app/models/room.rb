class Room < ActiveRecord::Base
    belongs_to :building
    belongs_to :facility_type, foreign_key: 'facilitytype_id'
end
