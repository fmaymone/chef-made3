class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_type
      t.integer :number_people
      t.datetime :date_event
      t.string :event_name
      t.text :summary
      t.string :address
      t.boolean :is_public
      t.integer :price
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
