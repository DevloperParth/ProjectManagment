class Drop < ActiveRecord::Migration[7.0]
  def change
    drop_table :employee_job_details
  end
end
