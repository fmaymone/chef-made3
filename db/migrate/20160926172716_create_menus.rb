class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
