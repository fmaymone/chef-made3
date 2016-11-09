class AddLatitudeAndLongitudeToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :latitude, :float
    add_column :reservations, :longitude, :float
  end
end
