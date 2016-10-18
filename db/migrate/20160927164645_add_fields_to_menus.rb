class AddFieldsToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :people, :integer
    add_column :menus, :duration, :integer
    add_column :menus, :entrada, :string
    add_column :menus, :principal, :string
    add_column :menus, :sobremesa, :string
  end
end
