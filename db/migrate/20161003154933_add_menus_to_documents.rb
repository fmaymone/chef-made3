class AddMenusToDocuments < ActiveRecord::Migration
  def change
     add_reference :documents, :menu, index: true, foreign_key: true
  end
end
