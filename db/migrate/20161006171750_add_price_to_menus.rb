class AddPriceToMenus < ActiveRecord::Migration
  def change
    
    add_column :menus, :price, :integer, :null => false, :default => 0
    
  end
end
