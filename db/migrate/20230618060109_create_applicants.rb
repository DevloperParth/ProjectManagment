class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.references :employee, index: true
      t.references :job_detail, index: true
      t.timestamps
    end
  end
end
