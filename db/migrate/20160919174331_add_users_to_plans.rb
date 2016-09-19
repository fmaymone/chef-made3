class AddUsersToPlans < ActiveRecord::Migration
  def change
    add_reference :plans, :user, index: true, foreign_key: true
  end
end
