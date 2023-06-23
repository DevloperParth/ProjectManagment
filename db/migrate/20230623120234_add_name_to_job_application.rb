class AddNameToJobApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :job_applications, :name, :string
  end
end
