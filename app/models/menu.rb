class Menu < ActiveRecord::Base
    
    belongs_to :user
    has_many :menu_tags
    has_many :tags, through:  :menu_tags
    
    has_many :documents
    
    has_many :reservations, as: :reservable
    
    has_many :reviews, as: :reviewable
    
    validates :user, presence: true
    validates :title, presence: true
    
    def all_tags=(names)
      self.tags = names.split(",").map do |name|
          Tag.where(name: name.strip).first_or_create!
      end
    end

    def all_tags
      self.tags.map(&:name).join(", ")
    end
end
