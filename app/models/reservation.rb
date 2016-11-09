class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :reservable, polymorphic: true
  
  validates  :user, :address,:presence => true
  
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
