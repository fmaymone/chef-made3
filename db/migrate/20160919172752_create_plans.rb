class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :kind
      t.text :description

      t.timestamps null: false
    end
  end
end
