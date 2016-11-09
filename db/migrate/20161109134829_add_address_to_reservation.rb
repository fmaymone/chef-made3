class AddAddressToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :address, :text
  end
end
