class AddTitleToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :title, :string
  end
end
