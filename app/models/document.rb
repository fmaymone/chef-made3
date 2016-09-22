class Document < ActiveRecord::Base
  belongs_to :user
  
  enum kind: { cpf: 0, rg: 1 , antecedentes:2}
  
  has_attached_file :image

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
end
