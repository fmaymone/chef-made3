class AddAttachmentImageToMenuPictures < ActiveRecord::Migration
  def self.up
    change_table :menu_pictures do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :menu_pictures, :image
  end
end
