class MenuTag < ActiveRecord::Base
  belongs_to :menu
  belongs_to :tag
end
