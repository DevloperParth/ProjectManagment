class AddStatusToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :application_status, :integer
  end
end
