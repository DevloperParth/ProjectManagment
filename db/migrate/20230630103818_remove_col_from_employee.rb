class RemoveColFromEmployee < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :application_status
    remove_column :employees, :appliedforjob
    remove_column :employees, :otp
  end
end
