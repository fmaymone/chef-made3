class MenusTags < ActiveRecord::Migration
def self.up
  create_table 'menus_tags', :id => false do |t|
    t.column :menu_id, :integer
    t.column :tag_id, :integer
  end
end
end
