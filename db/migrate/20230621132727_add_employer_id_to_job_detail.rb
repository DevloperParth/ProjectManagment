class AddEmployerIdToJobDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :job_details, :employee_id, :integer
    add_index :job_details, :employee_id
  end
end
