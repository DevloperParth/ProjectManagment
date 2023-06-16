class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.belongs_to :job_details
      t.belongs_to :employees
      t.timestamps
    end
  end
end
