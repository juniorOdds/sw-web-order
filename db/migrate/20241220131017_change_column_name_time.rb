class ChangeColumnNameTime < ActiveRecord::Migration[7.1]
  def change
    rename_column :details, :reservedStartDate, :start_time
    rename_column :details, :reservedEndDate, :end_time
  end
end
