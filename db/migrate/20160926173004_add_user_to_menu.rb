class AddUserToMenu < ActiveRecord::Migration
  def change
  
    add_reference :menus, :user, index: true, foreign_key: true
  
  end
end
