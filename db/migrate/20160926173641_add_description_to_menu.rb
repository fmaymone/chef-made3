class AddDescriptionToMenu < ActiveRecord::Migration
  def change
     add_column :menus, :description, :text
  end
end
