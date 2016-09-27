class CreateMenuTags < ActiveRecord::Migration
  def change
    create_table :menu_tags do |t|
      t.belongs_to :menu, index: true, foreign_key: true
      t.belongs_to :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
