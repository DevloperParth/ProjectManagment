class AddurlToJobDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :job_details, :job_url, :string
  end
end
