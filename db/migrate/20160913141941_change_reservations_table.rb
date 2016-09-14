class ChangeReservationsTable < ActiveRecord::Migration
 def self.up
    change_table :reservations do |t|
      t.references :room
    end
  end

  def self.down
    change_table :reservations do |t|
      t.remove :event_id
    end
  end
end

