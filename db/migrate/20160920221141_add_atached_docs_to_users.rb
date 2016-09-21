class AddAtachedDocsToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :photo, index: true, foreign_key: true
  end
end
