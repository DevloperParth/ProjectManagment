class AddCategoryIdToJobDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :job_details, :category_id, :integer
  end
end
