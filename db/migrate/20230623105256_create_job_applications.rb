class CreateJobApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.belongs_to :job_detail
      t.belongs_to :employee
      t.timestamps
    end
  end
end
