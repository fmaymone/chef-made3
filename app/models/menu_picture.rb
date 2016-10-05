class MenuPicture < ActiveRecord::Base
  belongs_to :menu
  
  enum kind: { entrada: 0, principal: 1, sobremesa: 2 }
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
