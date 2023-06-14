class ChangeIntegerLimitInEmployees < ActiveRecord::Migration[7.0]
  def change
    change_column :employees, :contact_num, :integer, limit: 8
  end
end
