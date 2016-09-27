class AddMenuToTag < ActiveRecord::Migration
  def change
  
    add_reference :tags, :menu, index: true, foreign_key: true
  
  end
end
