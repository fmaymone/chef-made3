class CreateMenuPictures < ActiveRecord::Migration
  def change
    create_table :menu_pictures do |t|
      t.references :menu, index: true, foreign_key: true
      t.integer :kind

      t.timestamps null: false
    end
  end
end
