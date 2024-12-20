class AddFieldInDetail < ActiveRecord::Migration[7.1]
  def change
    add_column :details, :reservedName, :string
    add_column :details, :reservedDate, :date
    add_column :details, :zoneControl, :string
    add_column :details, :voltage, :string
    add_column :details, :deviceRange, :string
    add_column :details, :deviceType, :string
  end
end
