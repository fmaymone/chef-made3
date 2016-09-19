class AddDocFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :cpf, :integer
    add_column :users, :rg, :integer
    add_column :users, :isFichaAntecedentes, :boolean
    add_column :users, :isRg, :boolean
    add_column :users, :isCpf, :boolean
    add_column :users, :miniCurriculo, :text
  end
end
