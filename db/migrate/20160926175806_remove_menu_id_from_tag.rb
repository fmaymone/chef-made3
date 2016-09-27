class RemoveMenuIdFromTag < ActiveRecord::Migration
  def change
      remove_column :tags, :menu_id
  end
end
