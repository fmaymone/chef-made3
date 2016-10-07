class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :reservable, polymorphic: true
end
