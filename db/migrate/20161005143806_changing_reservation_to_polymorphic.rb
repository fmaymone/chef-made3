class ChangingReservationToPolymorphic < ActiveRecord::Migration
  def change
    add_column :reservations, :reservable_id, :integer
    add_column :reservations, :reservable_type, :string
    
    add_index :reservations, :reservable_id
    add_index :reservations, :reservable_type
     
  end
end
