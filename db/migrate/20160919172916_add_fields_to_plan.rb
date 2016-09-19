class AddFieldsToPlan < ActiveRecord::Migration
  def change
    
    add_column :plans, :value, :integer
    add_column :plans, :isRenewable, :boolean
  end
end
