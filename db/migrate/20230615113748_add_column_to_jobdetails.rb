class AddColumnToJobdetails < ActiveRecord::Migration[7.0]
  def change
    add_column :job_details, :Applicants, :text
    add_column :job_details, :ApplicationCount,  :integer
  end
end
