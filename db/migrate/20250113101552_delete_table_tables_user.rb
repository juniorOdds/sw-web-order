class DeleteTableTablesUser < ActiveRecord::Migration[7.1]
  def change
    drop_table :table_users
  end
end
