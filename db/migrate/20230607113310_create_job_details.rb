class CreateJobDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :job_details do |t|
      t.belongs_to :employer
      t.string :Job_title
      t.text :Job_summary
      t.text :Qualification_skills
      t.text :Experience
      t.integer :salary
      t.timestamps
    end
  end
end
