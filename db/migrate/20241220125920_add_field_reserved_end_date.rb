class AddFieldReservedEndDate < ActiveRecord::Migration[7.1]
  def change
    add_column :details, :reservedEndDate, :date
    rename_column :details, :reservedDate, :reservedStartDate
  end
end
