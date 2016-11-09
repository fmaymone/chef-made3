class Tag < ActiveRecord::Base
    has_many :menu_tags
    has_many :menus, through: :menu_tags
    
    validates :name, presence: true, length: { minimum: 3 }
   
end
