class AddJobDetailIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :job_detail_id, :integer
    add_index :employees, :job_detail_id
  end
end
