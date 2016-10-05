class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu
  
  enum kind: { documentos: 0 , cardapio:3}
  
  has_attached_file :image

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
end
