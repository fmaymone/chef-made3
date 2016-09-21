class ChangeRgAndCpfInUsers < ActiveRecord::Migration
  def change
    change_column :users, :rg, :string
    change_column :users, :cpf, :string
    
  end
end
