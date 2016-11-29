class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :menu
  belongs_to :reviewable, polymorphic: true
end
