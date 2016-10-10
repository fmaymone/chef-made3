class ChangeReviewToPolymorphic < ActiveRecord::Migration
  def change
  
    add_column :reviews, :reviewable_id, :integer
    add_column :reviews, :reviewable_type, :string
    
    add_index :reviews, :reviewable_id
    add_index :reviews, :reviewable_type
     
  
  end
end
