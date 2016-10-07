class DeleteRoomIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :reservations, :room_id
  end
end
