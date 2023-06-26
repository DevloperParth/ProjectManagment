class AddUniqueIndexToJobApplication < ActiveRecord::Migration[7.0]
  def change
    add_index :job_applications, [:job_detail_id, :employee_id], unique: true
  end
end
