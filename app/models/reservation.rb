class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :reservable, polymorphic: true
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  def getDateAbsolute
    self.start_date.to_s(:number)
  end

end
