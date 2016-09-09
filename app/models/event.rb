class Event < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  
  validates :event_type, presence:true
  validates :number_people, presence:true
  validates :summary, presence:true
  validates :address, presence:true
  validates :price, presence:true
  validates :event_name, presence:true, length:{maximum: 50 }
  validates :summary, presence:true, length:{maximum: 50 }
  
end
