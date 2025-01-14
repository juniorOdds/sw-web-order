class AddFieldInTableUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :userID, :string
    add_column :users, :name, :string
    add_column :users, :password, :string
    add_column :users, :email, :string
    add_column :users, :phone, :string
    add_column :users, :depID, :string
    add_column :users, :dep, :string
    add_column :users, :roleID, :string
  end
end
