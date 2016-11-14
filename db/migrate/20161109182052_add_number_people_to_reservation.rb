class AddNumberPeopleToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :number_people, :integer
    
  end
end
